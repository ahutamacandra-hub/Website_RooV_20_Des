<?php

use Livewire\Volt\Component;
use Livewire\Attributes\Layout;
use App\Models\Property;
use Illuminate\Support\Str;
use Illuminate\View\View;

new #[Layout('layouts.landing')] class extends Component {
    
    public Property $property;
    public $allPhotos = []; 
    public $schemaData = [];

    // Data Kalkulator
    public $harga_properti = 0;
    public $dp_persen = 20;     
    public $bunga_persen = 5;   
    public $tenor_tahun = 20;   
    public $cicilan_bulan = 0;

    public function mount($slug)
    {
        $this->property = Property::where('slug', $slug)
            ->where('is_active', true)
            ->firstOrFail();

        $this->harga_properti = $this->property->price;
        $this->hitungKPR();

        // Gabungkan Cover + Gallery
        $this->allPhotos[] = $this->getPhotoUrl($this->property->photo);
        if (!empty($this->property->gallery) && is_array($this->property->gallery)) {
            foreach($this->property->gallery as $gal) {
                $this->allPhotos[] = $this->getPhotoUrl($gal);
            }
        }

        $this->schemaData = [
            '@context' => 'https://schema.org',
            '@type' => 'Product',
            'name' => $this->property->title,
            'description' => Str::limit(strip_tags($this->property->description), 160),
            'image' => $this->allPhotos,
            'offers' => [
                '@type' => 'Offer',
                'priceCurrency' => 'IDR',
                'price' => $this->property->price,
            ],
        ];
    }

    public function getPhotoUrl($path) {
        if (!$path) return asset('images/default-house.jpg');
        return Str::startsWith($path, 'http') ? $path : asset('storage/'.$path);
    }

    public function hitungKPR()
    {
        $dp_val = is_numeric($this->dp_persen) ? (float)$this->dp_persen : 0;
        $bunga_val = is_numeric($this->bunga_persen) ? (float)$this->bunga_persen : 0;
        $tenor_val = is_numeric($this->tenor_tahun) ? (float)$this->tenor_tahun : 0;

        $pokok = $this->harga_properti * (1 - ($dp_val / 100));
        
        if ($pokok > 0 && $bunga_val > 0 && $tenor_val > 0) {
            $r = ($bunga_val / 100) / 12;
            $n = $tenor_val * 12;
            $this->cicilan_bulan = $pokok * ($r / (1 - pow(1 + $r, -$n)));
        } else {
            $this->cicilan_bulan = 0;
        }
    }

    public function updated($name)
    {
        if (in_array($name, ['dp_persen', 'bunga_persen', 'tenor_tahun'])) {
            $this->hitungKPR();
        }
    }

    public function with(): array
    {
        $waText = "Halo, saya tertarik dengan properti: " . $this->property->title . " (" . route('properties.show', $this->property->slug) . ")";
        return ['whatsappUrl' => "https://wa.me/6281234567890?text=" . urlencode($waText)];
    }

    public function rendering(View $view): void
    {
        $view->layoutData([
            'title' => $this->property->title . " - Roov Property",
            'description' => Str::limit(strip_tags($this->property->description), 155),
            'image' => $this->allPhotos[0] ?? null
        ]);
    }
}; ?>

<div class="bg-gray-50 min-h-screen font-sans pb-12" 
     x-data="{ 
        activeSlide: 0, 
        slides: @js($allPhotos),
        lightboxOpen: false,
        lightboxImg: '',
        next() { this.activeSlide = (this.activeSlide === this.slides.length - 1) ? 0 : this.activeSlide + 1 },
        prev() { this.activeSlide = (this.activeSlide === 0) ? this.slides.length - 1 : this.activeSlide - 1 }
     }"
     x-init="setInterval(() => next(), 5000)">
    
    <x-slot name="head">
        <script type="application/ld+json">{!! json_encode($schemaData) !!}</script>
        <style>[x-cloak] { display: none !important; }</style>
    </x-slot>

    {{-- NAVBAR --}}
    <nav x-data="{ mobileMenuOpen: false }" class="bg-white text-gray-800 sticky top-0 z-50 shadow-sm border-b border-gray-100">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-20 items-center">
                <div class="flex items-center"><a href="{{ route('home') }}" wire:navigate><img src="{{ asset('images/Logo.png') }}" class="h-12 w-auto"></a></div>
                <div class="hidden md:flex items-center gap-8 font-bold text-sm tracking-wide">
                    <a href="{{ route('home') }}" class="text-gray-600 hover:text-[#0A192F] transition" wire:navigate>HOME</a>
                    <a href="{{ route('developers') }}" class="text-gray-600 hover:text-[#0A192F] transition" wire:navigate>DEVELOPERS</a>
                    <a href="{{ route('kpr') }}" class="text-gray-600 hover:text-[#0A192F] transition" wire:navigate>KALKULATOR KPR</a>
                </div>
                <div class="flex md:hidden">
                    <button @click="mobileMenuOpen = !mobileMenuOpen" class="text-gray-600 p-2">
                        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path x-show="!mobileMenuOpen" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path><path x-show="mobileMenuOpen" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                    </button>
                </div>
            </div>
        </div>
        <div x-show="mobileMenuOpen" x-cloak class="md:hidden bg-white border-t border-gray-100 shadow-xl absolute w-full z-50">
            <div class="px-4 py-4 space-y-3 font-bold">
                <a href="{{ route('home') }}" class="block p-2" wire:navigate>Home</a>
                <a href="{{ route('developers') }}" class="block p-2" wire:navigate>Developers</a>
                <a href="{{ route('kpr') }}" class="block p-2" wire:navigate>KPR</a>
            </div>
        </div>
    </nav>

    {{-- LIGHTBOX MODAL --}}
    <div x-show="lightboxOpen" 
         x-cloak
         class="fixed inset-0 z-[100] flex items-center justify-center bg-black/95 p-4 md:p-10"
         @keydown.escape.window="lightboxOpen = false">
        <button @click="lightboxOpen = false" class="absolute top-6 right-6 text-white hover:text-gray-400 z-[110] transition-colors">
            <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
        </button>
        <img :src="lightboxImg" class="max-w-full max-h-full object-contain rounded-lg shadow-2xl">
    </div>

    {{-- AUTO SLIDER BANNER --}}
    <div class="relative h-[350px] md:h-[600px] bg-gray-900 overflow-hidden group">
        <template x-for="(slide, index) in slides" :key="index">
            <img x-show="activeSlide === index" 
                 x-transition:enter="transition duration-1000 ease-in-out" 
                 x-transition:leave="transition duration-1000 ease-in-out" 
                 :src="slide" class="absolute inset-0 w-full h-full object-cover">
        </template>
        <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent"></div>
        
        <button @click="prev()" class="absolute left-4 top-1/2 -translate-y-1/2 bg-white/20 hover:bg-white/40 p-2 rounded-full text-white backdrop-blur-sm transition z-30 opacity-0 group-hover:opacity-100">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path></svg>
        </button>
        <button @click="next()" class="absolute right-4 top-1/2 -translate-y-1/2 bg-white/20 hover:bg-white/40 p-2 rounded-full text-white backdrop-blur-sm transition z-30 opacity-0 group-hover:opacity-100">
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path></svg>
        </button>

        <div class="absolute bottom-10 left-0 right-0 max-w-7xl mx-auto px-6 z-10">
            <div class="flex gap-2 mb-3">
                <span class="bg-[#D4AF37] text-white text-[10px] font-bold px-2 py-1 rounded uppercase tracking-wider shadow-sm">{{ $property->listing_type }}</span>
                <span class="bg-white/20 text-white text-[10px] font-bold px-2 py-1 rounded uppercase tracking-wider border border-white/30 backdrop-blur-sm shadow-sm">{{ $property->property_type }}</span>
            </div>
            <h1 class="text-3xl md:text-5xl font-black text-white mb-2 drop-shadow-md">{{ $property->title }}</h1>
            <p class="text-gray-200 font-medium flex items-center gap-2 drop-shadow-sm"><span>📍</span> {{ $property->district }}, {{ $property->city }}</p>
        </div>

        <div class="absolute bottom-6 left-0 right-0 flex justify-center gap-2 z-30">
            <template x-for="(slide, index) in slides" :key="index">
                <div class="h-1.5 rounded-full transition-all duration-500"
                     :class="activeSlide === index ? 'bg-[#D4AF37] w-8' : 'bg-white/40 w-2'"></div>
            </template>
        </div>
    </div>

    {{-- KONTEN UTAMA (Jarak Diperbaiki: mt-10 alih-alih -mt-10) --}}
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 mt-5 relative z-20">
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2 space-y-8">
                
                {{-- SPESIFIKASI --}}
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 md:p-8">
                    <h3 class="text-xl font-bold text-[#0A192F] mb-8 flex items-center gap-3"><span class="w-1.5 h-6 bg-[#D4AF37] rounded-full"></span> Spesifikasi Unit</h3>
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-y-8 gap-x-4">
                        <div><span class="text-[10px] text-gray-400 font-bold uppercase block mb-1">K. Tidur</span><span class="text-lg font-bold text-[#0A192F]">🛏️ {{ $property->bedrooms }} {{ $property->maid_bedrooms > 0 ? '+'.$property->maid_bedrooms : '' }}</span></div>
                        <div><span class="text-[10px] text-gray-400 font-bold uppercase block mb-1">K. Mandi</span><span class="text-lg font-bold text-[#0A192F]">🚿 {{ $property->bathrooms }} {{ $property->maid_bathrooms > 0 ? '+'.$property->maid_bathrooms : '' }}</span></div>
                        <div><span class="text-[10px] text-gray-400 font-bold uppercase block mb-1">L. Tanah</span><span class="text-lg font-bold text-[#0A192F]">📐 {{ $property->land_area }} m²</span></div>
                        <div><span class="text-[10px] text-gray-400 font-bold uppercase block mb-1">L. Bangunan</span><span class="text-lg font-bold text-[#0A192F]">🏠 {{ $property->building_area }} m²</span></div>
                        <div><span class="text-[10px] text-gray-400 font-bold uppercase block mb-1">Listrik</span><span class="font-bold text-gray-800">⚡ {{ $property->electricity }} W</span></div>
                        <div><span class="text-[10px] text-gray-400 font-bold uppercase block mb-1">Sertifikat</span><span class="font-bold text-gray-800">📜 {{ $property->certificate }}</span></div>
                    </div>

                    <div class="mt-10 border-t border-gray-100 pt-8">
                        <h4 class="text-xs font-bold text-gray-400 uppercase mb-4 tracking-widest">Fasilitas Properti</h4>
                        <div class="flex flex-wrap gap-2">
                            @if($property->has_smart_home) <span class="bg-blue-50 text-blue-700 px-4 py-1.5 rounded-full text-xs font-bold border border-blue-100">✨ Smart Home</span> @endif
                            @if($property->has_pool) <span class="bg-cyan-50 text-cyan-700 px-4 py-1.5 rounded-full text-xs font-bold border border-cyan-100">🏊 Kolam Renang</span> @endif
                            @if($property->is_hook) <span class="bg-amber-50 text-amber-700 px-4 py-1.5 rounded-full text-xs font-bold border border-amber-100">🏗️ Posisi Hook</span> @endif
                            @if($property->has_garden) <span class="bg-green-50 text-green-700 px-4 py-1.5 rounded-full text-xs font-bold border border-green-100">🌳 Taman</span> @endif
                        </div>
                    </div>
                </div>

                {{-- GALERI FOTO --}}
                @if(count($allPhotos) > 1)
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 md:p-8">
                    <h3 class="text-xl font-bold text-[#0A192F] mb-2">Galeri Foto</h3>
                    <p class="text-[10px] text-gray-400 uppercase mb-6 tracking-widest">Klik gambar untuk memperbesar</p>
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-3">
                        @foreach($allPhotos as $idx => $img)
                        <button @click="lightboxImg = '{{ $img }}'; lightboxOpen = true" 
                                class="aspect-square rounded-xl overflow-hidden border-2 border-transparent hover:border-[#D4AF37] transition duration-300 shadow-sm group">
                            <img src="{{ $img }}" class="w-full h-full object-cover group-hover:scale-110 transition duration-500">
                        </button>
                        @endforeach
                    </div>
                </div>
                @endif

                {{-- DESKRIPSI --}}
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 md:p-8">
                    <h3 class="text-xl font-bold text-[#0A192F] mb-6">Deskripsi Properti</h3>
                    <div class="prose max-w-none text-gray-600 leading-relaxed whitespace-pre-line">{{ $property->description }}</div>
                </div>

                {{-- KALKULATOR KPR --}}
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 md:p-8">
                    <h3 class="text-xl font-bold text-[#0A192F] mb-6">Simulasi Cicilan KPR</h3>
                    <div class="bg-gray-50 p-6 rounded-2xl border border-gray-200">
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                            <div><label class="block text-[10px] font-bold text-gray-500 uppercase mb-2">Uang Muka (%)</label><input type="number" wire:model.live="dp_persen" class="w-full rounded-xl border-gray-200 font-bold focus:ring-[#D4AF37] focus:border-[#D4AF37]"></div>
                            <div><label class="block text-[10px] font-bold text-gray-500 uppercase mb-2">Bunga per Tahun (%)</label><input type="number" step="0.1" wire:model.live="bunga_persen" class="w-full rounded-xl border-gray-200 font-bold focus:ring-[#D4AF37] focus:border-[#D4AF37]"></div>
                            <div><label class="block text-[10px] font-bold text-gray-500 uppercase mb-2">Tenor (Tahun)</label><input type="number" wire:model.live="tenor_tahun" class="w-full rounded-xl border-gray-200 font-bold focus:ring-[#D4AF37] focus:border-[#D4AF37]"></div>
                        </div>
                        <div class="text-center py-6 border-t border-gray-200 border-dashed">
                            <span class="text-xs text-gray-400 font-bold uppercase block mb-1">Angsuran Bulanan</span>
                            <span class="text-4xl font-black text-[#D4AF37]">Rp {{ number_format($cicilan_bulan, 0, ',', '.') }}</span>
                        </div>
                        {{-- Tombol Akses Pro --}}
                        <div class="-mt-5 text-center">
                            <a href="{{ route('kpr', ['price' => $harga_properti]) }}" 
                               class="inline-block text-[11px] font-extrabold text-[#0A192F] bg-white px-4 py-2 rounded-lg border border-gray-200 shadow-sm hover:bg-[#0A192F] hover:text-white transition uppercase tracking-tighter">
                                Buka Kalkulator Pro &rarr;
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            {{-- SIDEBAR HARGA --}}
            <div class="space-y-6">
                <div class="bg-white rounded-2xl shadow-xl border-t-4 border-[#D4AF37] p-8 sticky top-24">
                    <p class="text-gray-400 text-[10px] font-bold uppercase tracking-[0.2em] mb-2 text-center">
                        {{ $property->is_price_start_from ? 'Mulai Dari' : 'Penawaran Terbaik' }}
                    </p>
                    <div class="text-center mb-8 pb-8 border-b border-gray-100">
                        <p class="text-4xl font-black text-[#0A192F]">Rp {{ number_format($property->price, 0, ',', '.') }}</p>
                    </div>
                    <a href="{{ $whatsappUrl }}" target="_blank" class="w-full flex items-center justify-center gap-3 bg-[#25D366] hover:bg-[#20bd5a] text-white font-bold py-4 px-6 rounded-2xl transition shadow-lg hover:shadow-xl group">
                        <svg class="w-6 h-6 group-hover:scale-110 transition duration-300" fill="currentColor" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.008-.57-.008-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z"/></svg>
                        <span>Hubungi via WhatsApp</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>