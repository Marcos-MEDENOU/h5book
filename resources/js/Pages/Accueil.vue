<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import Icon from '@/Components/Icons/Icon.vue'
import { Head } from '@inertiajs/vue3';

import { ref } from 'vue';

// State
const isDropdownOpen = ref(false);

// Dropdown options
const dropdownOptions = ref(['Option 1', 'Option 2', 'Option 3']);

// Methods
const toggleDropdown = () => {
    isDropdownOpen.value = !isDropdownOpen.value;
};

const selectOption = (option) => {
    // Handle option selection logic here
    console.log(`Selected: ${option}`);
    isDropdownOpen.value = false; // Close the dropdown after selection
};
</script>

<template>
    <Head title="Accueil" />

    <AuthenticatedLayout>
        <!-- Status -->
        <section class=" m-5 flex gap-3 bg-white  overflow-hidden">


            <div class="p-2 border-2 rouded-md border-blue-200 w-40 h-44 rounded-md shadow-md  justify-center items-center">
                <div
                    class="p-4 border-b bg-[#0c7fb9] rounded-md shadow-md flex flex-col justify-center items-center h-full gap-3">
                    <span class="w-12 h-12 rounded-full flex items-center justify-center bg-white opacity-50">
                        <Icon name="plus" />
                    </span>
                    <p class="text-sm text-white">Ajouter</p>
                </div>
            </div>

            <div class="p-2 borde bg-orange-400  w-40 h-44 rounded-md shadow-md  justify-center items-center relative">
<span><Icon name="sun"/></span>
                <div class="absolute bottom-2">
                    <p class="text-sm text-white">Josephile Water</p>
                    <p class="text-sm text-white">Actif</p>
                </div>
            </div>

            <div class="p-2 borde bg-red-400  w-40 h-44 rounded-md shadow-md  justify-center items-center relative">
                <div class="absolute bottom-2">
                    <p class="text-sm text-white">Josephile Water</p>
                    <p class="text-sm text-white">Actif</p>
                </div>
            </div>

        </section>

        <!-- Creation de post -->

        <section class="bg-white  overflow-hidden">
            <div class="m-5 flex items-center gap-3 ">

                <h1>Créer un poste</h1>

                <div class="relative">
                    <button @click="toggleDropdown" class="   text-sm">Public</button>

                    <!-- Dropdown -->
                    <div v-if="isDropdownOpen" class="mt-2 absolute z-50 ">
                        <ul class="bg-white border rounded-md shadow-md">
                            <li v-for="(option, index) in dropdownOptions" :key="index"
                                class="py-2 px-4 cursor-pointer hover:bg-gray-100" @click="selectOption(option)">
                                {{ option }}
                            </li>
                        </ul>
                    </div>
                </div>
                <div>
                   <p class="text-sm">Go live</p>
                </div>

            </div>
        </section>



    </AuthenticatedLayout>
</template>
