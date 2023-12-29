<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import ComposantUser from '@/Composables/UserComposant.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Friends" />
    <AuthenticatedLayout>
        <main class="mt-[-20px]">
            <ComposantUser :filesProfil="profil" :covers="cover" :lastImage="lImg" :niveau="'photos'" :followin="userfollow"
                :followe="followers" :usersIdentifiant="user" />
            <section class="bg-white mt-[13px] mb-8 pb-8">
                <div>
                    <div class="border-[#e4e7e9e5] border-b-[1px]">
                        <div class="px-2 py-4 flex items-center mx-auto w-[90%]">
                            <div class="flex gap-4 basis-full items-center">
                                <h3 class="font-bold text-[15px] text-sky-600" @click="friend()" id="amis">Votre galerie
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="flex justify-between mx-auto w-[90%] mt-4">
                        <div
                            class="h-[250px] w-[48%] rounded cursor-pointer hover:border-gray-400 hover:border-[1px] hover:shadow-xl">
                            <figure class="relative">
                                <div class="relative h-[250px] rounded">
                                    <img class="object-cover w-[250px] h-full rounded"
                                        :src="cover === null ? `/storage/images/profile.jpg` : `/storage/coverImage/${cover}`"
                                        alt="image_de_couverture">
                                </div>
                                <figcaption class="absolute bottom-0 left-0 right-0">
                                    <div class="flex flex-col items-center">
                                        <p class="mt-[-4px] text-[14px] font-bold text-white">Photos de couverture</p>
                                        <p class="mt-[-4px] text-[12px] font-bold text-white mb-2">{{ allCover }} photo(s)
                                        </p>
                                    </div>
                                </figcaption>
                            </figure>
                        </div>
                        <div
                            class="h-[250px] w-[48%] rounded cursor-pointer hover:border-gray-400 hover:border-[1px] hover:shadow-xl">
                            <figure class="relative">
                                <div class="relative h-[250px] rounded">
                                    <img :src="profil === null ? `/storage/images/profile.jpg` : `/storage/profilImage/${profil}`"
                                        class="object-cover w-[250px] h-full rounded" alt="image_de_profil">
                                </div>
                                <figcaption class="absolute bottom-0 left-0 right-0">
                                    <div class="flex flex-col items-center">
                                        <p class="mt-[-4px] text-[14px] font-bold text-white">Photos de profil</p>
                                        <p class="mt-[-4px] text-[12px] font-bold text-white mb-2">
                                            <span v-if="allProfil == 0">0</span>
                                            <span v-else>{{ allProfil }}</span>
                                            photo(s)
                                        </p>
                                    </div>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </AuthenticatedLayout>
</template>

<script>
export default {
    props: {
        following: Number,
        follower: Number,
        cover: String,
        lImg: Array,
        profil: String,
        getLastImgProfil: Array,
        user: Array,
        countCover: Number,
        countProfil: Number,
    },

    data() {
        return {
            varBool: false,
            users: this.follow,
            userfollow: this.following,
            userfollowing: this.userFollowing,
            followers: this.follower,
            allCover: this.countCover,
            allProfil: this.countProfil,
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