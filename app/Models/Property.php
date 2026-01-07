<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Laravel\Scout\Searchable;

class Property extends Model
{
    use HasFactory, Searchable;

    protected $guarded = [];

    protected $casts = [
        'is_active' => 'boolean',
        'is_hook' => 'boolean',
        'has_pool' => 'boolean',
        'has_carport' => 'boolean',
        'has_garden' => 'boolean',
        'has_canopy' => 'boolean',
        'has_smart_home' => 'boolean',
        'has_fence' => 'boolean',
        'is_price_start_from' => 'boolean', // Flag Mulai Dari
        'price' => 'integer',
        'gallery' => 'array',
        'garage_size' => 'integer',
        'carport_size' => 'integer',
        'maid_bedrooms' => 'integer',
        'maid_bathrooms' => 'integer',
    ];

    /**
     * Accessor untuk Estimasi Cicilan Bulanan (Digunakan di Home & Detail).
     * Asumsi standar: DP 20% dan Bunga 5% Tenor 20 Tahun.
     */
    public function getEstimatedMonthlyInstallmentAttribute(): float
    {
        $loanAmount = $this->price * 0.8;
        $interestRate = 0.05 / 12;
        $tenureMonths = 20 * 12;

        if ($loanAmount <= 0) return 0;

        return $loanAmount * ($interestRate / (1 - pow(1 + $interestRate, -$tenureMonths)));
    }

    public function toSearchableArray()
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            'address' => $this->address,
            'city' => $this->city,
            'district' => $this->district,
            'listing_type' => $this->listing_type,
            'property_type' => $this->property_type,
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
