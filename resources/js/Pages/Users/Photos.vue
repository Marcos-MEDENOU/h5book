<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import ComposantUser from '@/Composables/UserComposant.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Toutes les photos" />
    <AuthenticatedLayout>
        <main class="mt-[-20px]">
            <ComposantUser :filesProfil="profil" :covers="cover" :lastImage="lImg" :niveau="'photos'" :followin="userfollow"
                :followe="followers" :usersIdentifiant="user" :numberLik="numberLike" :allImg="getLastImgProfil" />
            <section class="bg-white mt-[13px] mb-8 pb-8">
                <div>
                    <div class="border-[#e4e7e9e5] border-b-[1px]">
                        <div class="px-2 py-4 flex items-center mx-auto w-[90%]">
                            <div class="flex gap-4 basis-full items-center">
                                <h3 class="font-bold text-[13px] text-sky-600" @click="friend()"  v-if="$page.props.auth.user.id === user.id" id="amis">Votre galerie
                                </h3>
                                <h3 class="font-bold text-[13px] text-sky-600" @click="friend()"  v-else id="amis">Sa galerie
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="flex justify-between mx-auto w-[90%] mt-4" v-if="allElement">
                        <div class="h-[250px] w-[48%] rounded hover:border-gray-400 hover:border-[1px] hover:shadow-xl"
                            v-if="coImg !== null">
                            <figure class="relative">
                                <div class="relative h-[250px] rounded" @click="openCovers">
                                    <img class="object-cover w-[250px] h-full rounded"
                                        :src="coImg === null ? `/storage/images/account.png` : `/storage/coverImage/${coImg}`"
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
                        <div class="h-[250px] w-[48%] rounded hover:border-gray-400 hover:border-[1px] hover:shadow-xl"
                            v-if="proImg !== null">
                            <figure class="relative">
                                <div class="relative h-[250px] rounded" @click="openProfil">
                                    <img :src="proImg === null ? `/storage/images/account.png` : `/storage/profilImage/${proImg}`"
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

                        <div v-if="coImg === null && proImg === null" class="text-gray-700 text-center w-full">
                            Pas de photos actuellement !
                        </div>
                    </div>

                    <div class="mx-auto w-[90%] mt-4" v-if="varCover">
                        <div class="relative">
                            <h4 class="text-gray-600 font-bold border-b-[1px] border-gray-300 py-3 px-2">Photos de
                                couverture</h4>
                                <span @click="actionsFour"
                                    class="absolute top-2 right-2 bg-gray-300 rounded-full cursor-pointer opacity-80 p-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M6.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM12.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM18.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                                    </svg>
                                </span>
                                <transition>
                                    <div v-if="myVarFour" class="z-50 absolute top-[45px] right-2 w-[130px] bg-gray-300 rounded text-white">
                                        <ul class="flex flex-col">
                                            <li v-if="$page.props.auth.user.id === user.id"
                                                class="text-[12px] text-gray-600 text-center font-bold py-1.5 px-1 cursor-pointer hover:rounded border-gray-400 border-b-[1px]"
                                                @click="supCovers">
                                                Supprimer l'album</li>
                                            <li
                                                class="text-[12px] text-gray-600 text-center font-bold py-1.5 px-1 cursor-pointer hover:rounded"
                                                @click="closeCover1">
                                                Fermer</li>
                                        </ul>
                                    </div>
                                </transition>
                        </div>
                        <div class="flex flex-wrap gap-y-4 justify-between mt-4">
                            <div v-for="(img, i) in coversImg" :key="i"
                                class="h-[250px] w-[48%] rounded hover:border-gray-400 hover:border-[1px] hover:shadow-xl cursor-pointer"
                                @click="modalCover(img.id, i)">
                                <div class="relative h-[250px] rounded">
                                    <img class="object-cover w-[250px] h-full rounded"
                                        :src="`/storage/coverImage/${img.cover_img}`" alt="image_de_couverture">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mx-auto w-[90%] mt-4" v-if="varCover1">
                        <div class="relative">
                            <h4 class="text-gray-600 font-bold border-b-[1px] border-gray-300 py-3 px-2">Photos de
                                profil</h4>
                            
                            <span @click="actionsFive"
                                    class="absolute top-2 right-2 bg-gray-300 rounded-full cursor-pointer opacity-80 p-1">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M6.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM12.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM18.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                                    </svg>
                                </span>
                                <transition>
                                    <div v-if="myVarFive" class="z-50 absolute top-[45px] right-2 w-[130px] bg-gray-300 rounded text-white">
                                        <ul class="flex flex-col">
                                            <li v-if="$page.props.auth.user.id === user.id"
                                                class="text-[12px] text-gray-600 text-center font-bold py-1.5 px-1 cursor-pointer hover:rounded border-gray-400 border-b-[1px]"
                                                @click="deleteProfil">
                                                Supprimer l'album</li>
                                            <li
                                                class="text-[12px] text-gray-600 text-center font-bold py-1.5 px-1 cursor-pointer hover:rounded"
                                                @click="cloverProfil">
                                                Fermer</li>
                                        </ul>
                                    </div>
                                </transition>
                        </div>
                        <div class="flex flex-wrap gap-y-4 justify-between mt-4">
                            <Link v-for="img in profiles"
                                class="h-[250px] w-[48%] rounded hover:border-gray-400 hover:border-[1px] hover:shadow-xl cursor-pointer"
                                :href="route('postProfil', { 'id': user_id, 'image': img.id })">
                            <div class="relative h-[250px] rounded">
                                <img class="object-cover w-[250px] h-full rounded"
                                    :src="`/storage/profilImage/${img.file_profile}`" alt="image_de_profil">
                            </div>
                            </Link>
                        </div>
                    </div>
                </div>
            </section>
            <div class="relative flex justify-center items-center z-50" v-if="otherVariable">
                <span
                    class="cursor-pointer fixed z-50 top-[12px] right-[5px] border-gray-300 border-[1px] bg-white rounded p-1"
                    @click="closeCover">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="black" class="w-3 h-3">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                    </svg>
                </span>
                
                <span v-if="$page.props.auth.user.id === user.id" @click="actionsThree"
                                class="cursor-pointer fixed z-50 top-[9px] right-[45px] border-gray-300 border-[1px] bg-white rounded-full p-1">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="currentColor" class="w-4 h-4">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M6.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM12.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM18.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                                </svg>
                            </span>
                            <transition>
                                <div v-if="myThreeVar" class="z-50 fixed top-[45px] bg-white right-12 w-[140px] rounded">
                                    <ul class="flex flex-col">
                                        <li @click="supOneCoverImg"
                                            class="text-[12px] text-gray-600 font-bold py-1.5 px-1 cursor-pointer hover:bg-gray-200 hover:rounded">
                                            Supprimer cette image</li>
                                    </ul>
                                </div>
                            </transition>
                <div id="menu" class="w-full h-full bg-gray-900 bg-opacity-80 top-0 fixed sticky-0" @click="suivant()">
                    <div v-if="otherVariable" class="absolute -translate-x-1/2 -translate-y-1/2 top-1/2 left-1/2 z-50">
                        <div class="w-[350px] relative flex flex-col justify-center items-center">
                            <div>
                                <div v-for="(img, ind) in coversImg">
                                    <div v-if="idCover === img.id">
                                        <img :src="`/storage/coverImage/${img.cover_img}`" alt="couverture"
                                            class="object-cover w-full max-h-[400px] rounded">
                                    </div>
                                </div>
                            </div>
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
        countLike: Number,
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
            myVarFour: false,
            myVarFive: false,
            varCover: false,
            varCover1: false,
            allElement: true,
            user_id: this.id,
            otherVariable: false,
            idCover: null,
            index: 0,
            coImg: this.cover,
            proImg: this.profil,
            myThreeVar: null,
            numberLike: this.countLike,
        }
    },

    methods: {
        // Fonction pour afficher toutes les images de couverture
        // By KolaDev
        openProfil() {
            this.myVarTwo = false;
            this.allElement = false;
            this.varCover1 = true;
            axios.post(route("openCovers", {
                id: this.user_id
            })).then(response => {
                this.coversImg = response.data.coversImages;
                this.profiles = response.data.profilsImages;
            })
        },

        // Fonction pour afficher toutes les images de couverture
        // By KolaDev
        openCovers() {
            this.allElement = false;
            this.varCover = true;
            axios.post(route("openCovers", {
                id: this.user_id
            })).then(response => {
                this.coversImg = response.data.coversImages;
                this.profiles = response.data.profilsImages;
            })
        },

        // Fonction pour supprimer toutes les images de couverture
        // By KolaDev
        supCovers() {
            this.myVar = !this.myVar;
            this.myVarFour = !this.myVarFour;
            axios.delete(route("supCovers")).then(response => {
                this.varCover = !this.varCover;
                this.allElement = true;
                this.coImg = null;
                this.allCover = 0;
                this.coversImg = response.data.coversImages;
                this.profiles = response.data.profilsImages;
            })
        },

        // Fonction pour supprimer toutes les images de profil
        // By KolaDev
        deleteProfil() {
            this.myVarTwo = !this.myVarTwo;
            this.myVarFive = !this.myVarFive;
            axios.delete(route("deleteProfil")).then(response => {
                this.varCover1 = !this.varCover1;
                this.allElement = true;
                this.proImg = null;
                this.allProfil = 0;
                this.coversImg = response.data.coversImages;
                this.profiles = response.data.profilsImages;
            })
        },

        // Fonction pour supprimer une image de couverture
        // By KolaDev
        supOneCoverImg() {
            this.myThreeVar = !this.myThreeVar;
            axios.delete(route("supOneCoverImg", {
                id: this.idCover
            })).then(response => {
                this.coversImg = response.data.coversImages;
                this.profiles = response.data.profilsImages;
                if (this.coversImg.length === 0) {
                    this.coImg = null;
                    this.index = null;
                    this.allCover = 0;
                    this.otherVariable = !this.otherVariable;
                    this.closeCover();
                } else {
                    this.idCover = this.coversImg[0].id;
                    this.index = 0;
                }
            })
        },

        // Fonction pour fermer le modal d'afficher de l'image de couverture
        // By KolaDev
        closeOtherModal() {
            this.otherVariable = !this.otherVariable;
        },

        // Fonction pour afficher les actions qu'on peut effectuer sur l'album des images de profil
        // By KolaDev
        actionsThree() {
            this.myThreeVar = !this.myThreeVar;
        },

        // Fonction pour afficher une image de couverture
        // By KolaDev
        modalCover(i, index) {
            this.idCover = i;
            this.index = index;
            this.otherVariable = !this.otherVariable;
        },

        // Fonction pour afficher l'image suivante
        // By KolaDev
        suivant() {
            let value = this.index + 1;
            if (value >= this.coversImg.length) {
                value = 0;
            }

            if (this.coversImg[value]) {
                this.idCover = this.coversImg[value].id;
                this.index = value;
            }
        },

        // Fonction pour fermer la zone des images de couverture
        // By KolaDev
        closeCover1() {
            this.allElement = true;
            this.varCover = false;
            this.myVarFour = false;
        },

        // Fonction pour fermer la zone des images de couverture
        // By KolaDev
        closeCover() {
            this.otherVariable = false;
            this.myThreeVar = false;
        },

        // Fonction pour fermer la zone des images de profil
        // By KolaDev
        cloverProfil() {
            this.allElement = true;
            this.varCover1 = false;
            this.myVarFive = false;
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
        },

        actionsFour() {
            this.myVarFour = !this.myVarFour;
        },

        actionsFive() {
            this.myVarFive = !this.myVarFive;
        }
    }
}

</script>