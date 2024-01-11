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
                <span>
                    <Icon name="sun" />
                </span>
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

        <section class="bg-white mb-3">
            <div class="w-full p-4 flex flex-col gap-2">
                <div class="flex items-center gap-2">
                    <div>
                        <img class="rounded-full aspect-square w-[50px]" src="/storage/images/fond_bleu.jpg" alt="">
                    </div>
                    <h1>Créer un poste</h1>
                    <div class="relative">
                        <div>
                            <button class="text-sm" @click="action">Public</button>
                        </div>
                        <transition>
                            <div v-if="varBool1" class="absolute top-7 -right-15 bg-white w-[170px] rounded z-40 border">
                                <ul>
                                    <li class="py-2.5 px-2 border-gray-200 border-b-[1px]">
                                        <form>
                                            <label class="text-gray-700 text-sm flex items-center gap-2" for="file"><svg
                                                    xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                                    viewBox="0 0 24 24" fill="none" stroke="gray" stroke-width="2"
                                                    stroke-linecap="round" stroke-linejoin="round"
                                                    class="feather feather-image icon-font-light iw-16 ih-16">
                                                    <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                                                    <circle cx="8.5" cy="8.5" r="1.5"></circle>
                                                    <polyline points="21 15 16 10 5 21"></polyline>
                                                </svg>Public</label>
                                            <input type="file" id="file" class="hidden">
                                        </form>
                                    </li>
                                    <li class="text-gray-700 text-sm flex items-center gap-2 py-2.5 px-2 border-b-[1px]"><svg
                                            xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" class="feather feather-trash-2 icon-font-light iw-16 ih-16">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path
                                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                            </path>
                                            <line x1="10" y1="11" x2="10" y2="17"></line>
                                            <line x1="14" y1="11" x2="14" y2="17"></line>
                                        </svg>Amis</li>
                                    <li class="text-gray-700 text-sm flex items-center gap-2 py-2.5 px-2 border-b-[1px]"><svg
                                            xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" class="feather feather-trash-2 icon-font-light iw-16 ih-16">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path
                                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                            </path>
                                            <line x1="10" y1="11" x2="10" y2="17"></line>
                                            <line x1="14" y1="11" x2="14" y2="17"></line>
                                        </svg>Amis Sauf</li>
                                    <li class="text-gray-700 text-sm flex items-center gap-2 py-2.5 px-2"><svg
                                            xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" class="feather feather-trash-2 icon-font-light iw-16 ih-16">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path
                                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                            </path>
                                            <line x1="10" y1="11" x2="10" y2="17"></line>
                                            <line x1="14" y1="11" x2="14" y2="17"></line>
                                        </svg>Amis spécifique</li>
                                    <li class="text-gray-700 text-sm flex items-center gap-2 py-2.5 px-2"><svg
                                            xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" class="feather feather-trash-2 icon-font-light iw-16 ih-16">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path
                                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                            </path>
                                            <line x1="10" y1="11" x2="10" y2="17"></line>
                                            <line x1="14" y1="11" x2="14" y2="17"></line>
                                        </svg>Seulement moi</li>
                                </ul>
                            </div>
                        </transition>
                    </div>
                    <div>
                        <p class="text-sm">Go live</p>
                    </div>

                    <span class="self-end">...</span>
                </div>
                <div
                    class="w-full p-1"
                    >
                    <!-- <template v-if="selectedColorIndex !== null"> -->
                        <div
                            class="bg-pink-300"
                            :class="`${colorArray[selectedColorIndex]}`">
                            <textarea rows="1" class="min-w-full resize-none" placeholder="Ecrire quelque chose ici..."></textarea>
                        </div>
                    <!-- </template> -->
                    <!-- <template v-else>
                        <textarea rows="1" class="min-w-full resize-none" placeholder="Ecrire quelque chose ici..."></textarea>
                    </template> -->
                </div>

                <div>
                    <textarea
                    v-if="selectedColorIndex !== null"
                    rows="1"
                    :class="`${colorArray[selectedColorIndex]}`"
                    class="min-w-full resize-none"></textarea>
                    <ul class="flex flex-wrap gap-1 ">
                        <li v-for="(color, index ) in colorArray"
                            :key="index"
                            class="bg-sky-700 aspect-square rounded-full w-[20px]"
                            :class="`${color}`" :id="'li-'+index"
                            @click="openTextarea(index)">
                        </li>
                    </ul>
                </div>

                <button
                class="w-full bg-[#0c7fb9] text-white text-center p-2 rounded-lg" type="button">PUBLIER</button>
            </div>
        </section>

        <section class="bg-white">
            <div><p>say hello</p></div>
        </section>



    </AuthenticatedLayout>
</template>
<script>
export default {
    data() {
        return {
            varBool1: false,
            textTextareColor: [ // Tableau contenant les couleur de text dans le textarea
                "text-black",
                "text-white",
                "text-gray-400",
                "text-gray-800",
                "text-red-400",
                "text-red-900",
                "text-lime-50"
            ],
            colorArray: [
                "bg-gradient-to-r from-cyan-500 to-blue-500",
                "bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500",
                "bg-gradient-to-r from-gray-700 to-lime-700",
                "bg-gradient-to-t from-gray-700 to-lime-700",
                "bg-gradient-to-t from-gray-700 to-rose-400",
                "bg-gradient-to-t from-gray-700 to-rose-700",
                "bg-gradient-to-br from-gray-700 to-pink-400",
                "bg-gradient-to-br from-gray-700 to-slate-400",
                "bg-gradient-to-br from-gray-700 to-sky-800",
                "bg-gradient-to-br from-gray-700 to-sky-400",
                "bg-gradient-to-br from-gray-700 to-fuchsia-400",
                "bg-gradient-to-br from-gray-700 to-rose-200",
            ], // TAbleau de couleur
            selectedColorIndex: null, // Indice de l'élément li affichant le tableau de couleur sélectionner
        }
    },

    methods: {

        openTextarea(_index) {
            this.selectedColorIndex = _index; // Met à jour l'indice de l'élément li sélectionné
        },

        action() {
            this.varBool1 = !this.varBool1;
        }
    }
}

</script>

<style scope>.v-enter-active {
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
}</style>
