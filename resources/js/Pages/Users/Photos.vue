<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import ComposantUser from '@/Composables/UserComposant.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Friends" />
    <AuthenticatedLayout>
        <main class="mt-[-20px]">
            <ComposantUser :niveau="'photos'" />

            <section class="bg-white mt-[13px] mb-8 pb-8">
                <div class="border-[#e4e7e9e5] border-b-[1px]">
                    <div class="px-2 py-4 flex items-center mx-auto w-[90%]">
                        <div class="flex gap-4 basis-[50%]">
                            <h3 class="font-bold text-[15px] text-sky-600" @click="friend()" id="amis">Gallerie</h3>
                            <Link :href="route('friends')"
                                :class="niveau === 'friends' ? 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px] text-sky-800' : 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px]'">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-users iw-14 ih-14">
                                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                <circle cx="9" cy="7" r="4"></circle>
                                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                            </svg>Amis</Link>
                            <Link :href="route('friends')"
                                :class="niveau === 'friends' ? 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px] text-sky-800' : 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px]'">
                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="feather feather-users iw-14 ih-14">
                                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                <circle cx="9" cy="7" r="4"></circle>
                                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                            </svg>Amis</Link>
                        </div>
                    </div>
                </div>

            </section>
        </main>
    </AuthenticatedLayout>
</template>

<script>
export default {
    data() {
        return {
            varBool: false,
        }
    },

    methods: {
        // Fonction pour afficher tous les amis de l'utilisateur connecté
        friend() {
            suggest.classList.remove("text-sky-600");
            suggest.classList.add("text-gray-600");
            amis.classList.remove("text-gray-600");
            amis.classList.add("text-sky-600");
            divAmis.classList.remove("hidden");
            divSuggest.classList.add("hidden");
        },

        // Fonction pour suggérer des amis à l'utilisateur connecté
        suggest() {
            amis.classList.remove("text-sky-600");
            amis.classList.add("text-gray-600");
            suggest.classList.remove("text-gray-600");
            suggest.classList.add("text-sky-600");
            divAmis.classList.add("hidden");
            divSuggest.classList.remove("hidden");
        },
    }
}

</script>