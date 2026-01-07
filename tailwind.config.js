import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Figtree', ...defaultTheme.fontFamily.sans],
            },
            // WARNA BRANDING ROOV (Tambahkan bagian ini)
            colors: {
                'roov-navy': '#0F172A', // Biru Dongker Gelap (Warna Utama)
                'roov-blue': '#1E3A8A', // Biru Laut
                'roov-gold': '#EAB308', // Emas Elegan (Aksen)
                'roov-gold-light': '#FACC15', // Emas Terang (Hover)
            }
        },
    },

    plugins: [forms],
};