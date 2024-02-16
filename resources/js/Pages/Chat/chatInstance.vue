<script setup>
import { Head, Link } from '@inertiajs/vue3';
import Navbar from '@/Composables/Navbar.vue';
import { usePage, router } from '@inertiajs/vue3'
defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
    laravelVersion: {
        type: String,
        required: true,
    },
    phpVersion: {
        type: String,
        required: true,
    },
});


const chatInstance = () => {
    console.log("hahaha");
}
</script>

<template>
    <Head title="Chat" />

    <section class="relative w-full bg-white py-4 sticky top-0 z-50">

        <div class="relative w-full mx-auto bg-top bg-cover max-w-6xl lg:py-4 ">

            <div class="grid row-gap-8 ml-auto mr-auto sm:row-gap-5 ">
                <div class="flex w-[95%] mx-auto justify-between items-center">
                    <section class="flex items-center cursor-pointer ">
                        <div class="flex justify-center items-center gap-2">
                            <Link class="relative cursor-pointer" :href="route('chat')">
                            <svg data-slot="icon" fill="none" stroke-width="1.1" stroke="#0389c9" viewBox="0 0 24 24"
                                class="w-6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M10.5 19.5 3 12m0 0 7.5-7.5M3 12h18">
                                </path>
                            </svg>
                            </Link>
                            <div class="relative">
                                <img src="https://sufyan.me/_nuxt/images/sufyan-e995a0.webp"
                                    class="object-cover w-10 h-10  rounded-full shadow" />
                                <span class="absolute text-green-500 right-[-0.5rem] bottom-[-0.3rem]">
                                    <svg width="20" height="20">
                                        <circle cx="8" cy="8" r="6" fill="currentColor"></circle>
                                    </svg>
                                </span>
                            </div>

                        </div>

                        <div class="relative">
                            <p class="ml-2 font-bold text-[#118fcc]">MEDENOU Marcos</p>
                            <p class="ml-2 text-sm text-gray-400">en ligne</p>
                        </div>
                    </section>

                    <section class="flex justify-center items-center gap-1">
                        <span>
                            <svg data-slot="icon" fill="none" stroke="#b5b8ba" stroke-width="1.1" viewBox="0 0 24 24"
                                class="w-6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z">
                                </path>
                            </svg>
                        </span>
                        <span>
                            <svg data-slot="icon" fill="none" stroke="#b5b8ba" stroke-width="1.1" viewBox="0 0 24 24"
                                class="w-6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z">
                                </path>
                            </svg>
                        </span>
                        <span>
                            <svg data-slot="icon" fill="none" stroke="#b5b8ba" stroke-width="1.1" viewBox="0 0 24 24"
                                class="w-6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z">
                                </path>
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z">
                                </path>
                            </svg>
                        </span>
                        <span>
                            <svg data-slot="icon" fill="none" stroke="#b5b8ba" stroke-width="1.1" viewBox="0 0 24 24"
                                class="w-6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </span>
                    </section>


                </div>
            </div>
        </div>
    </section>

    <section class=" bg-gray-100">

        <div class="flex flex-col flex-auto ">
            <div class="flex flex-col flex-auto flex-shrink-0 rounded-2xl h-full">
                <div class="flex flex-col h-full overflow-x-auto mb-4">
                    <div class="flex flex-col h-full">
                        <div class="grid grid-cols-12 gap-y-2">
                            <div class="col-start-1 col-end-9 p-3 rounded-lg">
                                <div class="flex flex-row items-center">
                                    <div class="relative">
                                        <img src="https://sufyan.me/_nuxt/images/sufyan-e995a0.webp"
                                            class="object-cover w-10 h-10  rounded-full shadow" />

                                    </div>
                                    <div class="relative ml-2 text-sm bg-white py-2 px-4 shadow rounded-xl">
                                        <div>Hey How are you today?</div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-start-6 col-end-13 p-3 rounded-lg">
                                <div class="flex items-center justify-start flex-row-reverse">

                                    <div class="relative mr-3 text-sm bg-[#0389c9] py-2 px-4 shadow rounded-xl">
                                        <div class="text-white">I'm ok what about you?</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-start-6 col-end-13 p-3 rounded-lg">
                                <div class="flex items-center justify-start flex-row-reverse">

                                    <div class="relative mr-3 text-sm bg-[#0389c9] py-2 px-4 shadow rounded-xl">
                                        <div class="text-white">
                                            Lorem ipsum dolor sit, amet consectetur adipisicing. ?
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-start-1 col-end-9 p-3 rounded-lg">
                                <div class="flex flex-row items-center">
                                    <div class="relative">
                                        <img src="https://sufyan.me/_nuxt/images/sufyan-e995a0.webp"
                                            class="object-cover w-10 h-10  rounded-full shadow" />

                                    </div>
                                    <div class="relative ml-2 text-sm bg-white py-2 px-4 shadow rounded-xl">
                                        <div>Hey How are you today?</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-start-6 col-end-13 p-3 rounded-lg">
                                <div class="flex items-center justify-start flex-row-reverse">

                                    <div class="relative mr-3 bg-[#0389c9]  text-sm py-2 px-4 shadow rounded-xl">
                                        <div class="text-white">
                                            Lorem ipsum dolor sit, amet consectetur adipisicing. ?
                                        </div>
                                        <div class="absolute text-xs bottom-0 right-0 -mb-5 mr-2 text-gray-500">
                                            Vu
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-start-1 col-end-9 p-3 rounded-lg">
                                <div class="flex flex-row items-center">
                                    <div class="relative">
                                        <img src="https://sufyan.me/_nuxt/images/sufyan-e995a0.webp"
                                            class="object-cover w-10 h-10  rounded-full shadow" />

                                    </div>
                                    <div class="relative ml-2 text-sm bg-white py-2 px-4 shadow rounded-xl">
                                        <div>Hey How are you today?</div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="flex flex-row items-center h-16 rounded-xl bg-white w-full px-4  sticky bottom-0 z-50">
                    <div>
                        <button class="flex items-center justify-center text-gray-400 hover:text-gray-600">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                xmlns="http://www.w3.org/2000/svg">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z">
                                </path>
                            </svg>
                      
                        </button>
                    </div>
                    <div class="flex-grow ml-2">
                        <div class="relative w-full">
                            <input type="text" class="flex w-full border-none placeholder-gray-500 rounded-xl pl-4 h-10"
                                placeholder="Taper du texte ici" />
                            <button
                                class="absolute flex items-center justify-center h-full w-12 right-0 top-0 text-gray-400 hover:text-gray-600">
                            
                                <svg class="w-6 h-6 transform rotate-45 -mt-px" fill="none" stroke="#0389c9"
                                    viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div>
                        <button
                            class="flex items-center justify-center bg-[#edf7fb] rounded-full text-white px-4 py-1 flex-shrink-0 w-8 h-8">
                            <span>
                                <svg class="w-6 h-6 font-bold" fill="none" stroke="black" viewBox="0 0 24 24"
                                    xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4"></path>
                                </svg>

                            </span>
                        </button>
                    </div>
                </div>
            </div>
        </div>

    </section>
</template>

