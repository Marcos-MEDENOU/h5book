<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import Navbar from '@/Layouts/Navbar.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Friends" />
    <Navbar />

    <main>
        <section class="bg-white">
            <div class="relative bg-[url('/storage/images/profile.jpg')] bg-center bg-no-repeat bg-cover h-[170px]">
                <button
                    class="absolute text-sm top-4 right-4 bg-white border-none colorblue font-bold py-1.5 px-2 rounded-lg hover:text-white hover:bg-[url('/storage/images/profile.jpg')]">Modifier
                    couverture</button>
                <div
                    class="absolute top-28 left-48 bg-[url('/storage/images/profile.jpg')] bg- bg-no-repeat bg-cover bg-center h-[105px] w-[105px] rounded-full border-white border-[6px]">
                </div>
            </div>
            <div class="mt-8 flex flex-col items-center gap-4 py-5">
                <div class="flex flex-col items-center">
                    <h2 class="font-bold text-gray-600 text-[21px]">Kelin Jasen ❤</h2>
                    <p class="text-sm text-gray-600">kelin.jasen156@gmail.com</p>
                </div>
                <div class="flex gap-8">
                    <div class="flex flex-col items-center px-4">
                        <p class="font-bold">546</p>
                        <p class="text-sm text-gray-500">Following</p>
                    </div>
                    <div class="flex flex-col items-center border-sky-500 border-x-[1px] px-5">
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
            <ul class="flex gap-4 justify-center items-center mx-auto w-[90%]">
                <Link class="flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-sm"><svg
                    xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                    class="feather feather-info iw-14 ih-14">
                    <circle cx="12" cy="12" r="10"></circle>
                    <line x1="12" y1="16" x2="12" y2="12"></line>
                    <line x1="12" y1="8" x2="12.01" y2="8"></line>
                </svg>A propos</Link>
                <Link class="flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-sm"><svg
                    xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                    class="feather feather-users iw-14 ih-14">
                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                    <circle cx="9" cy="7" r="4"></circle>
                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                </svg>Amis</Link>
                <Link class="flex items-center justify-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-sm"><svg
                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-4 h-4">
                    <path stroke-linecap="round" stroke-linejoin="round"
                        d="m2.25 15.75 5.159-5.159a2.25 2.25 0 0 1 3.182 0l5.159 5.159m-1.5-1.5 1.409-1.409a2.25 2.25 0 0 1 3.182 0l2.909 2.909m-18 3.75h16.5a1.5 1.5 0 0 0 1.5-1.5V6a1.5 1.5 0 0 0-1.5-1.5H3.75A1.5 1.5 0 0 0 2.25 6v12a1.5 1.5 0 0 0 1.5 1.5Zm10.5-11.25h.008v.008h-.008V8.25Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                </svg>
                Photos</Link>
                <Link class="flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-sm"><svg
                    xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                    class="feather feather-list iw-14 ih-14">
                    <line x1="8" y1="6" x2="21" y2="6"></line>
                    <line x1="8" y1="12" x2="21" y2="12"></line>
                    <line x1="8" y1="18" x2="21" y2="18"></line>
                    <line x1="3" y1="6" x2="3.01" y2="6"></line>
                    <line x1="3" y1="12" x2="3.01" y2="12"></line>
                    <line x1="3" y1="18" x2="3.01" y2="18"></line>
                </svg>Vos activités</Link>
            </ul>
        </div>

        <section class="bg-white mt-[13px] mb-8 pb-8">
            <div class="border-[#e4e7e9e5] border-b-[1px]">
                <div class="px-2 py-4 flex justify-between items-center mx-auto w-[90%]">
                    <div class="flex gap-4 basis-[50%]">
                        <button class="font-bold text-[17px] text-sky-600">Amis</button>
                        <button class="font-bold text-[17px] text-gray-600">Suggestions</button>
                    </div>
                    <form class="basis-[40%] bg-[#e4e7e9e5] pr-2 flex items-center gap-2 rounded-lg border">
                        <input type="text" placeholder="Recherchez un proche..."
                            class="text-sm w-full py-1 bg-[#e4e7e9e5] border-none outline-none rounded">
                        <svg class="w-4 h-4 text-gray-800 dark:text-white" aria-hidden="true"
                            xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                            <path stroke="gray" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                        </svg>
                    </form>
                </div>
            </div>

            <div class="mx-auto w-[80%] mt-4 flex justify-between flex-wrap gap-y-8">
                <article class="basis-[20%] flex flex-col items-center gap-2" v-for="i in 10">
                    <div class="border-sky-600 border-l-4 rounded-full">
                        <div class="bg-[url('/storage/images/img.webp')] bg-center bg-no-repeat bg-cover h-[70px] w-[70px] rounded-full border-white border-4">
                        </div>
                    </div>
                    <div class="flex flex-col items-center">
                        <h3 class="text-gray-800 font-bold">Kelin Jasen ❤</h3>
                        <p class="text-sm text-gray-600">kelin.jasen156@gmail.com</p>
                    </div>
                    <div class="mt-2">
                        <button class="w-full rounded-lg py-1.5 px-5 hover:bg-[#0389c9] hover:text-white text-sky-500 font-bold border-sky-500 border-[1px] text-sm">Voir le profil</button>
                    </div>
                </article>
            </div>
        </section>
    </main>
</template>

<style scope>
body {
    background-color: #e4e7e9e5;
}

.bgColor {
    background-color: #f8f9fa;
}

.colorblue {
    color: #0389c9
}</style>