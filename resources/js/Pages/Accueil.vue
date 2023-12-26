<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import Icon from '@/Components/Icons/Icon.vue'
import { Head } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Accueil" />

    <AuthenticatedLayout>
        <div class=" m-5 flex gap-4 bg-white  overflow-hidden">


            <div class="p-2 border-2 rouded-md border-blue-200 w-36 h-40 rounded-md shadow-md  justify-center items-center">
                <div
                    class="p-4 border-b bg-[#0c7fb9] rounded-md shadow-md flex flex-col justify-center items-center h-full gap-3">
                    <span class="w-12 h-12 rounded-full flex items-center justify-center bg-white opacity-50"><Icon name="plus" /></span>
                    <p class="text-sm text-white">Ajouter</p>
                </div>
            </div>

            <div class="p-2 borde bg-orange-400  w-36 h-40 rounded-md shadow-md  justify-center items-center">
<p class="text-sm text-white">Actif</p>
            </div>
            <div class="p-2 borde bg-red-400  w-36 h-40 rounded-md shadow-md  justify-center items-center">
<p class="text-sm text-white">Actif</p>
            </div>

        </div>



    </AuthenticatedLayout>
</template>
