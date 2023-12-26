<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import Navbar from '@/Layouts/Navbar.vue';
import { Head } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Friends" />
    <Navbar />

    <main>
        <section>
            <div class="bg-[url('/storage/images/profile.jpg')] bg-center bg-no-repeat bg-cover h-[150px]">
            </div>
            <button class="bgColor border-none colorblue font-bold">Modifier l'arrière-plan</button>
        </section>
    </main>
</template>

<style scope>
.bgColor {
    background-color: #f8f9fa;
}
.colorblue {
    color: #0389c9
}
</style>