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


const chatInstance=()=>{
    console.log("hahaha");
}
</script>

<template>
    <Head title="Chat" />
    <!-- <Navbar/> -->
    <div class=" py-4 sticky top-0 z-50">
        <div class="mx-auto w-[92%] flex justify-between items-center">
            <div class="flex items-center gap-4">
                <div class="relative">
                    <svg data-slot="icon" fill="none" stroke-width="1.1" stroke="#0389c9" viewBox="0 0 24 24" class="w-6"
                        xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5 3 12m0 0 7.5-7.5M3 12h18"></path>
                    </svg>
                </div>

            </div>
            <div class="flex items-center gap-4">

                <form class="bg-[#edf7fb] flex items-center gap-4 py-1 pl-4 pr-1 border-none  rounded-full">
                    <div class="">
                        <svg class="w-4 h-4 text-gray-800 dark:text-white" aria-hidden="true"
                            xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                            <path stroke="#0389c9" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                        </svg>
                    </div>
                    <input type="text"
                        class="w-full bg-[#edf7fb] py-1 rounded-lg placeholder:text-gray-400 text-sm placeholder:text-sm border-transparent focus:border-transparent focus:border-none"
                        placeholder="Trouver des amis ...">
                </form>
            </div>
            <div class="w-10 h-10 bg-[#0389c9] flex justify-center items-center rounded-full">

                <svg data-slot="icon" fill="none" stroke-width="1.1" stroke="white" viewBox="0 0 24 24" class="w-5"
                    xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                    <path stroke-linecap="round" stroke-linejoin="round" class="bg-[#edf7fb] "
                        d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10">
                    </path>
                </svg>
            </div>
        </div>
    </div>

    <section class="relative w-full bg-white">

        <div class="relative w-full   py-4 mx-auto bg-top bg-cover max-w-6xl lg:py-4 ">

            <div class="grid gap-5 row-gap-8 ml-auto mr-auto sm:row-gap-5 ">
                <Link class="flex items-center cursor-pointer" :href="route('chatInstance')" >
                    <div class="relative">
                        <img src="https://sufyan.me/_nuxt/images/sufyan-e995a0.webp"
                            class="object-cover w-14 h-14 ml-4 rounded-full shadow" />
                        <span class="absolute text-green-500 right-[-0.4rem] bottom-[-0.2rem]">
                            <svg width="20" height="20">
                                <circle cx="8" cy="8" r="8" fill="currentColor"></circle>
                            </svg>
                        </span>
                    </div>

                    <div class="relative">
                        <p class="ml-2 text-lg font-bold text-[#118fcc]">MEDENOU Marcos</p>
                        <p class="ml-2 text-sm text-gray-400">en ligne</p>
                    </div>
                    
                </Link>
            </div>
        </div>
    </section>
</template>

