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
                <div class="flex items-center gap-4">
                    <div class="aspect-square rounded-full">
                        <img class="rounded-full aspect-square w-[50px]" src="/storage/images/smile.png" alt="">
                    </div>
                    <h1 class="text-lg font-extrabold">Créer un poste</h1>
                    <div class="relative">
                        <div>
                            <button class="text-[13px] flex items-center justify-between gap-1" @click="action">
                                Public
                                <span>
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="m19.5 8.25-7.5 7.5-7.5-7.5" />
                                    </svg>
                                </span>
                            </button>
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
                                    <li class="text-gray-700 text-sm flex items-center gap-2 py-2.5 px-2 border-b-[1px]">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round"
                                            class="feather feather-trash-2 icon-font-light iw-16 ih-16">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path
                                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                            </path>
                                            <line x1="10" y1="11" x2="10" y2="17"></line>
                                            <line x1="14" y1="11" x2="14" y2="17"></line>
                                        </svg>Amis
                                    </li>
                                    <li class="text-gray-700 text-sm flex items-center gap-2 py-2.5 px-2 border-b-[1px]">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round"
                                            class="feather feather-trash-2 icon-font-light iw-16 ih-16">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path
                                                d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                            </path>
                                            <line x1="10" y1="11" x2="10" y2="17"></line>
                                            <line x1="14" y1="11" x2="14" y2="17"></line>
                                        </svg>Amis Sauf
                                    </li>
                                    <li class="text-gray-700 text-sm flex items-center gap-2 py-2.5 px-2"><svg
                                            xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round"
                                            class="feather feather-trash-2 icon-font-light iw-16 ih-16">
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
                                            stroke-linejoin="round"
                                            class="feather feather-trash-2 icon-font-light iw-16 ih-16">
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
                        <button
                            class="text-[13px] flex items-center justify-between gap-1">
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="currentColor" class="w-4 h-4">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="m15.75 10.5 4.72-4.72a.75.75 0 0 1 1.28.53v11.38a.75.75 0 0 1-1.28.53l-4.72-4.72M4.5 18.75h9a2.25 2.25 0 0 0 2.25-2.25v-9a2.25 2.25 0 0 0-2.25-2.25h-9A2.25 2.25 0 0 0 2.25 7.5v9a2.25 2.25 0 0 0 2.25 2.25Z" />
                                </svg>

                            </span>
                            Go live
                        </button>
                    </div>
                </div>
                <div class="w-full p-1">
                    <template v-if="selectedColorIndex !== null">
                        <div class="bg-pink-300 h-64 flex items-center p-5" :class="`${colorArray[selectedColorIndex]}`">
                            <textarea class="min-w-full text-white
                                overflow-hidden focus:ring focus:ring-transparent
                                cursor:text border-none outline-none rounded-md
                                text-center bg-transparent resize-none placeholder:text-white
                                placeholder:font-bold" placeholder="Ecrire quelque chose ici..."></textarea>
                        </div>
                    </template>
                    <template v-else>
                        <textarea rows="1" class="rounded min-w-full resize-none
                            focus:ring focus:ring-transparent
                            border-none bg-gray-200 placeholder:text-sm
                            placeholder:font-bold" placeholder="Ecris quelque chose ici..."></textarea>
                    </template>
                </div>

                <div class="flex items-center gap-1 justify-between px-2">
                    <ul class="flex flex-wrap gap-1 ">
                        <li v-for="(color, index ) in colorArray" :key="index" class="aspect-square rounded-full w-[20px]"
                            :class="`${color}`" :id="'li-' + index" @click="openTextarea(index)">
                        </li>
                    </ul>
                    <ul>
                        <li @click="closeTextarea" class="cursor-pointer flex item-center justify-center bg-white border
                            shadow aspect-square rounded-full w-[20px]">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                stroke="currentColor" class="text-red-500 w-5 h-5">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                            </svg>
                        </li>
                    </ul>
                </div>

                <button class="w-full bg-[#0c7fb9] text-white text-center p-2 rounded-lg" type="button">PUBLIER</button>
            </div>
        </section>

        <!--  -->
        <section class="bg-white">
            <div class="p-">
                <div class="flex items-center gap-4 p-4">
                    <img class="rounded-full aspect-square w-[50px]" src="/storage/images/smile.png" alt="">
                    <p class="font-bold text-gray-500">
                        Sufiya Eliza
                        <span class="text-xs block">30 Mins Ago</span>
                    </p>
                </div>
                <figure>
                    <img  class="px-5 py-2" src="/storage/images/la_go_a_lepe.jpg" alt="une jolie go">
                    <figcaption class="mx-4">
                        <h4 class="text-lg font-semibold text-gray-700 ">Celebration new album song launched</h4>
                        <div class="text-sm font-medium text-gray-500 m-1">
                            <span class="text-blue-700">#Musiccelebration</span>,
                            <span>#music</span>,
                            <span>#party</span>,
                            <span> #music</span>,
                        </div>
                        <p class="text-base/5 text-gray-400 font-light m-1">Lorem ipsum dolor sit amet consectetur,
                            adipisicing elit. Provident saepe blanditiis
                            suscipit placeat tempora dolorum facilis omnis
                            corporis nostrum dolorem!</p>
                        <div>
                            <ul class="flex justify-start -space-x-1.5">
                                <li class="">
                                    <img  class="w-6 h-6 rounded-full aspect-square" src="/storage/images/old.png" alt="une jolie go">
                                </li>
                                <li class="">
                                    <img  class="w-6 h-6 rounded-full aspect-square" src="/storage/images/certainly.png" alt="une jolie go">
                                </li>
                                <li class="">
                                    <img  class="w-6 h-6 rounded-full aspect-square" src="/storage/images/animal.png" alt="une jolie go">
                                </li>
                            </ul>
                        </div>
                    </figcaption>
                </figure>
                <div></div>
            </div>
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

        /**
         * Permet d'ouvrir un
         * textarea sur commande pour créer
         * un post en attribuant une valer à la
         * variable selectedColorIndex
         *
         * @param {*} _index
         */
        openTextarea(_index) {
            this.selectedColorIndex = _index; // Met à jour l'indice de l'élément li sélectionné
        },

        /**
         * Permet de cacher le textarea
         * afficher sur demande
         * en attribuant à nouveau la valeur
         * null à notre variable selectedColorIndex
         */
        closeTextarea() {
            this.selectedColorIndex = null;
        },

        action() {
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
