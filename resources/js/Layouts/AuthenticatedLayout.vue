<script setup>
import Navbar from '@/Composables/Navbar.vue';
import DropdownLink from '@/Components/DropdownLink.vue';
</script>

<template>
    <Navbar />

    <DropdownLink :href="route('logout')" method="post" as="button">
        Deconnexion
    </DropdownLink>
    <div class="mt-5">
        <!-- Page Content -->
        <main class="bg-[#ecf6fa]">
            <slot />
        </main>

    </div>
</template>
