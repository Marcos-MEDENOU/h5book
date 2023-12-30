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
                    <div class="flex justify-between mx-auto w-[90%] mt-4" v-if="allElement">
                        <div class="h-[250px] w-[48%] rounded hover:border-gray-400 hover:border-[1px] hover:shadow-xl">
                            <figure class="relative">
                                <div class="relative h-[250px] rounded">
                                    <img class="object-cover w-[250px] h-full rounded"
                                        :src="cover === null ? `/storage/images/profile.jpg` : `/storage/coverImage/${cover}`"
                                        alt="image_de_couverture">
                                </div>
                                <span @click="actionsOne"
                                    class="absolute top-2 right-2 bg-white rounded-full cursor-pointer opacity-80 p-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M6.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM12.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM18.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                                    </svg>
                                </span>
                                <transition>
                                    <div v-if="myVar" class="absolute top-[35px] bg-white right-2 w-[90px] rounded">
                                        <ul class="flex flex-col">
                                            <li class="text-[12px] text-gray-600 font-bold border-gray-300 border-b-[1px] py-1.5 px-1 cursor-pointer hover:bg-gray-200 hover:rounded"
                                                @click="openCovers">Ouvrir</li>
                                            <li v-if="$page.props.auth.user.id === user.id"
                                                class="text-[12px] text-gray-600 font-bold py-1.5 px-1 cursor-pointer hover:bg-gray-200 hover:rounded">
                                                Supprimer l'album</li>
                                        </ul>
                                    </div>
                                </transition>
                                <figcaption class="absolute bottom-0 left-0 right-0">
                                    <div class="flex flex-col items-center">
                                        <p class="mt-[-4px] text-[14px] font-bold text-white">Photos de couverture</p>
                                        <p class="mt-[-4px] text-[12px] font-bold text-white mb-2">{{ allCover }} photo(s)
                                        </p>
                                    </div>
                                </figcaption>
                            </figure>
                        </div>
                        <div class="h-[250px] w-[48%] rounded hover:border-gray-400 hover:border-[1px] hover:shadow-xl">
                            <figure class="relative">
                                <div class="relative h-[250px] rounded">
                                    <img :src="profil === null ? `/storage/images/profile.jpg` : `/storage/profilImage/${profil}`"
                                        class="object-cover w-[250px] h-full rounded" alt="image_de_profil">
                                </div>
                                <span @click="actionsTwo"
                                    class="absolute top-2 right-2 bg-white rounded-full cursor-pointer opacity-80 p-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M6.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM12.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM18.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                                    </svg>
                                </span>
                                <transition>
                                    <div v-if="myVarTwo" class="absolute top-[35px] bg-white right-2 w-[90px] rounded">
                                        <ul class="flex flex-col">
                                            <li
                                                class="text-[12px] text-gray-600 font-bold border-gray-300 border-b-[1px] py-1.5 px-1 cursor-pointer hover:bg-gray-200 hover:rounded">
                                                Ouvrir</li>
                                            <li v-if="$page.props.auth.user.id === user.id"
                                                class="text-[12px] text-gray-600 font-bold py-1.5 px-1 cursor-pointer hover:bg-gray-200 hover:rounded">
                                                Supprimer l'album</li>
                                        </ul>
                                    </div>
                                </transition>
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

                    <div class="mx-auto w-[90%] mt-4" v-if="varCover">
                        <div class="relative">
                            <h4 class="text-gray-600 font-bold border-b-[1px] border-gray-300 py-3 px-2">Photos de
                                couverture</h4>
                            <span
                                class="cursor-pointer absolute top-[12px] right-[5px] border-gray-300 border-[1px] bg-gray-300 rounded p-1"
                                @click="closeCover">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="black" class="w-3 h-3">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                                </svg>
                            </span>
                        </div>
                        <div class="flex justify-between mt-4">
                            <div v-for="(img, i) in coversImg" :key="i"
                                class="h-[250px] w-[48%] rounded hover:border-gray-400 hover:border-[1px] hover:shadow-xl cursor-pointer"
                                @click="modalCover(img.id)">
                                <div class="relative h-[250px] rounded">
                                    <img class="object-cover w-[250px] h-full rounded"
                                        :src="`/storage/coverImage/${img.cover_img}`" alt="image_de_couverture">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div v-if="otherVariable" class="w-full h-full bg-gray-900 bg-opacity-80 top-0 fixed sticky-0 z-50"
                @click="closeOtherModal">
            </div>
            <div v-if="otherVariable" class="fixed top-48 z-50 w-[90%] left-6">
                <div class="relative">
                    <div class="mx-auto w-[90%]">
                        <div>
                            <div v-for="(img, ind) in coversImg">
                                <div v-if="idCover === img.id">
                                    <p class="flex justify-end text-white italic font-bold">Publié le 28/12/2023</p>
                                    <img :src="`/storage/coverImage/${img.cover_img}`" alt="couverture"
                                        class="object-cover w-full h-[450px] rounded">
                                </div>
                            </div>
                            <span class="opacity-80 py-3 px-1 rounded fixed right-[45px] top-[325px] cursor-pointer hover:bg-gray-200">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="white" class="w-8 h-8">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                                </svg>
                            </span>
                            <span class="opacity-80 py-3 px-1 rounded fixed left-[45px] top-[325px] cursor-pointer hover:bg-gray-200">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="white" class="w-8 h-8">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5 8.25 12l7.5-7.5" />
                                </svg>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
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
        id: Number,
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
            profiles: [],
            coversImg: [],
            myVar: false,
            myVarTwo: false,
            varCover: false,
            allElement: true,
            user_id: this.id,
            otherVariable: false,
            idCover: null,
        }
    },

    methods: {
        // Fonction pour afficher toutes les images de couverture
        // By KolaDev
        openCovers() {
            this.myVar = false;
            this.allElement = false;
            this.varCover = true;
            axios.post(route("openCovers", {
                id: this.user_id
            })).then(response => {
                this.coversImg = response.data.coversImages;
                this.profiles = response.data.profilsImages;
            })
        },

        // 
        // By KolaDev
        closeOtherModal() {
            this.otherVariable = !this.otherVariable;
        },

        // 
        // By KolaDev
        modalCover(i) {
            this.idCover = i;
            this.otherVariable = !this.otherVariable;
        },

        // Fonction pour fermer la zone des images de couverture
        // By KolaDev
        closeCover() {
            this.allElement = true;
            this.varCover = false;
        },

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

        // Fonction pour afficher les actions qu'on peut faire sur l'album de couverture
        actionsOne() {
            this.myVar = !this.myVar;
            this.myVarTwo = false;
        },

        // Fonction pour afficher les actions qu'on peut faire sur l'album de profil
        actionsTwo() {
            this.myVarTwo = !this.myVarTwo;
            this.myVar = false;
        }
    }
}

</script>