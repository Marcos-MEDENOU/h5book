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

        <section class="bg-white">
            <div class="m-5 flex items-center gap-3 ">

                <h1>Créer un poste</h1>

                 <div class="relative">
                    <div>
                        <button
                            class="text-sm" @click="action">Public</button>
                    </div>
                    <transition>
                        <div v-if="varBool1" class="absolute top-7 -right-15 bg-white w-[170px] rounded z-40 border">
                            <ul>
                                <li class="py-2.5 px-2 border-gray-200 border-b-[1px]">
                                    <form>
                                        <label class="text-gray-700 text-sm flex items-center gap-2" for="file"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="gray" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-image icon-font-light iw-16 ih-16"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg>Public</label>
                                        <input type="file" id="file" class="hidden">
                                    </form>
                                </li>
                                <li class="text-gray-700 text-sm flex items-center gap-2 py-2.5 px-2 border-b-[1px]"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 icon-font-light iw-16 ih-16"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>Amis</li>
                                <li class="text-gray-700 text-sm flex items-center gap-2 py-2.5 px-2"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 icon-font-light iw-16 ih-16"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg>Seulement moi</li>
                            </ul>
                        </div>
                    </transition>
                </div>
                <div>
                   <p class="text-sm">Go live</p>
                </div>

            </div>
        </section>



    </AuthenticatedLayout>
</template>
<script>
export default {
    data() {
        return {
            varBool1: false,
        }
    },

    methods: {

        action()
        {
            this.varBool1 = !this.varBool1;
        }
    }
}

</script>

<style scope>
.v-enter-active {
    transition: all 0.8s;
}

.v-leave-active {
    transition: all 0.5s;
}

.v-enter-from {
    opacity: 0;
    transform: translateY(-20px);
}

.v-enter-to {
    opacity: 1;
    transform: translateY(0px);
}

.v-leave-from {
    transform: translateY(0px);
}

.v-leave-to {
    transform: translateY(-10px);
    opacity: 0;
}
</style>
