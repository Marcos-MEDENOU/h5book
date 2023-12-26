<script setup>
import Navbar from '@/Composables/Navbar.vue';
</script>

<template>
    <Navbar />
    <div class="mt-5">
        <!-- Page Content -->
        <main>
            <slot />
        </main>

    </div>
</template>
