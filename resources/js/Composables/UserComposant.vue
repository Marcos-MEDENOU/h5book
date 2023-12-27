<script setup>
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <section class="bg-white">
        <div class="relative bg-[url('/storage/images/profile.jpg')] bg-center bg-no-repeat bg-cover h-[170px] z-0">
            <button
                class="absolute text-sm top-4 right-4 bg-white border-none colorblue font-bold py-1.5 px-2 rounded-lg hover:text-white hover:bg-[url('/storage/images/profile.jpg')]"
                @click="action">Modifier
                couverture</button>
            <transition>
                <div v-if="varBool1" class="absolute top-[50px] right-4 bg-white w-[170px] rounded z-40">
                    <ul>
                        <li class="py-2.5 px-2 border-gray-200 border-b-[1px]">
                            <form>
                                <label class="text-gray-700 text-sm flex items-center gap-2" for="file"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                                        fill="none" stroke="gray" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-image icon-font-light iw-16 ih-16">
                                        <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                                        <circle cx="8.5" cy="8.5" r="1.5"></circle>
                                        <polyline points="21 15 16 10 5 21"></polyline>
                                    </svg>Choisir une photo</label>
                                <input type="file" id="file" class="hidden">
                            </form>
                        </li>
                        <li class="text-gray-700 text-sm flex items-center gap-2 py-2.5 px-2"><svg
                                xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-trash-2 icon-font-light iw-16 ih-16">
                                <polyline points="3 6 5 6 21 6"></polyline>
                                <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                </path>
                                <line x1="10" y1="11" x2="10" y2="17"></line>
                                <line x1="14" y1="11" x2="14" y2="17"></line>
                            </svg>Supprimer la photo</li>
                    </ul>
                </div>
            </transition>
        </div>
        <div class="mt-[-70px] flex flex-col items-center gap-4 py-5">
            <div
                class="bg-[url('/storage/images/profile.jpg')] bg- bg-no-repeat bg-cover bg-center h-[110px] w-[110px] rounded-full border-white border-[6px] z-30">
            </div>
            <div class="flex flex-col items-center mt-[-15px]">
                <h2 class="font-bold text-gray-600 text-[21px]">Kelin Jasen ❤</h2>
                <p class="text-sm text-gray-600">kelin.jasen156@gmail.com</p>
            </div>
            <div class="flex gap-8">
                <div class="flex flex-col items-center px-4">
                    <p class="font-bold">546</p>
                    <p class="text-sm text-gray-500">Following</p>
                </div>
                <div class="flex flex-col items-center border-sky-500 border-x-[1px] px-5   ">
                    <p class="font-bold">26335</p>
                    <p class="text-sm text-gray-500">Likes</p>
                </div>
                <div class="flex flex-col items-center px-4">
                    <p class="font-bold">6845</p>
                    <p class="text-sm text-gray-500">Followers</p>
                </div>
            </div>
            <div>
                <button
                    class="headerBg rounded-lg color py-1.5 px-3 hover:bg-[#f8f9fa] hover:text-sky-500 font-bold hover:border-sky-500 border-[1px] text-sm">Modifier
                    votre profil</button>
            </div>
        </div>
    </section>
    <div class="bg-white px-2 py-4 mt-[13px]">
        <div class="flex gap-2 items-center mx-auto w-[93%] flex-wrap">
            <Link :href="route('about')" :class="niveau === 'about' ? 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px] text-sky-800' : 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px]'">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                class="feather feather-info iw-14 ih-14">
                <circle cx="12" cy="12" r="10"></circle>
                <line x1="12" y1="16" x2="12" y2="12"></line>
                <line x1="12" y1="8" x2="12.01" y2="8"></line>
            </svg>A propos</Link>
            <Link :href="route('friends')" :class="niveau === 'friends' ? 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px] text-sky-800' : 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px]'">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                class="feather feather-users iw-14 ih-14">
                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                <circle cx="9" cy="7" r="4"></circle>
                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
            </svg>Amis</Link>
            <Link :href="route('photos')" :class="niveau === 'photos' ? 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px] text-sky-800' : 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px]'">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                class="w-4 h-4">
                <path stroke-linecap="round" stroke-linejoin="round"
                    d="m2.25 15.75 5.159-5.159a2.25 2.25 0 0 1 3.182 0l5.159 5.159m-1.5-1.5 1.409-1.409a2.25 2.25 0 0 1 3.182 0l2.909 2.909m-18 3.75h16.5a1.5 1.5 0 0 0 1.5-1.5V6a1.5 1.5 0 0 0-1.5-1.5H3.75A1.5 1.5 0 0 0 2.25 6v12a1.5 1.5 0 0 0 1.5 1.5Zm10.5-11.25h.008v.008h-.008V8.25Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
            </svg>
            Photos</Link>
            <Link :class="niveau === 'activity' ? 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px] text-sky-800' : 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px]'">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                class="feather feather-list iw-14 ih-14">
                <line x1="8" y1="6" x2="21" y2="6"></line>
                <line x1="8" y1="12" x2="21" y2="12"></line>
                <line x1="8" y1="18" x2="21" y2="18"></line>
                <line x1="3" y1="6" x2="3.01" y2="6"></line>
                <line x1="3" y1="12" x2="3.01" y2="12"></line>
                <line x1="3" y1="18" x2="3.01" y2="18"></line>
            </svg>Vos activités</Link>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        niveau: String,
    },
    data() {
        return {
            varBool1: false,
        }
    },

    methods: {
        // Fonction pour afficher toutes les actions que l'utilisateur peut mener sur l'image de sa couverture
        action() {
            this.varBool1 = !this.varBool1;
        }
    }
}

</script>

<style scope>
body {
    background-color: #e4e7e9e5;
}

.bgColor {
    background-color: #f8f9fa;
}

.colorblue {
    color: #0389c9
}

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