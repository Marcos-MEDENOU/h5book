<script setup>
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <section class="bg-white">
        <div>
        </div>
        <div class="relative h-[200px] z-0">
            <img :src="couverture !== null ? `/storage/coverImage/${couverture}` : `/storage/images/account.png`"
                class="object-cover h-[200px] w-full" alt="image_de_couverture">
            <button v-if="$page.props.auth.user.id === usersIdentifiant.id"
                class="absolute text-[12px] top-4 right-4 bg-white border-none colorblue font-bold py-1.5 px-2 rounded-lg hover:text-white hover:bg-[url('/storage/images/account.png')]"
                @click="action">Modifier
                couverture</button>
            <transition>
                <div v-if="varBool1" class="absolute top-[50px] right-4 bg-white w-[170px] rounded z-40">
                    <ul>
                        <li class="py-2.5 px-2 border-gray-200 border-b-[1px] cursor-pointer">
                            <form>
                                <label class="text-gray-700 text-[12px] flex items-center gap-2" for="file"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"
                                        fill="none" stroke="gray" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-image icon-font-light iw-16 ih-16">
                                        <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                                        <circle cx="8.5" cy="8.5" r="1.5"></circle>
                                        <polyline points="21 15 16 10 5 21"></polyline>
                                    </svg>Choisir une photo</label>
                                <input type="file" id="file" class="hidden" @change="inputFile">
                            </form>
                        </li>
                        <li class="text-gray-700 text-[12px] flex items-center gap-2 py-2.5 px-2 cursor-pointer"
                            @click="deleteCover"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round"
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
        <div class="mt-[-70px] flex flex-col items-center gap-4 py-5 z-50">
            <div class="h-[110px] w-[110px] rounded-full border-white border-[6px] z-30">
                <div v-if="fileProfil === null"><img :src="`/storage/images/account.png`"
                        class="object-cover h-[100px] w-[100px] rounded-full" alt="image_de_profil"></div>
                        <Link :href="route('postProfil', [usersIdentifiant.id, allImgs.id])" v-else><img :src="`/storage/profilImage/${fileProfil}`"
                            class="object-cover h-[100px] w-[100px] rounded-full" alt="image_de_profil"></Link>
                        </div>
            <div class="flex flex-col items-center mt-[-15px]">
                <h2 class="font-bold text-gray-600 text-[14px]">{{ usersIdentifiant.name }}</h2>
                <p class="text-[12px] text-gray-600">{{ usersIdentifiant.email }}</p>
            </div>
            <div class="flex gap-8 mt-[-10px]">
                <div class="flex items-center gap-2 px-4">
                    <p class="font-bold">{{ followin }}</p>
                    <Link :href="route('abonnements', usersIdentifiant.uuid)" class="text-[13px] text-gray-500">Abonnement(s)</Link>
                </div>
                <div class="flex items-center gap-2 px-4">
                    <p class="font-bold">{{ followe }}</p>
                    <Link :href="route('abonnees', usersIdentifiant.uuid)" class="text-[13px] text-gray-500">Abonné(s)</Link>
                </div>
            </div>
            <div class="mt-[-5px]">
                <button @click="openModal" v-if="$page.props.auth.user.id === usersIdentifiant.id"
                    class="headerBg rounded-lg color py-1.5 px-3 hover:bg-[#f8f9fa] hover:text-sky-500 font-bold hover:border-sky-500 border-[1px] text-[12px]">Modifier
                    votre profil</button>
            </div>
        </div>
    </section>
    <div class="bg-white px-2 py-4 mt-[13px]">
        <div class="flex gap-2 items-center mx-auto w-[97%] flex-wrap">
            <Link :href="route('about', usersIdentifiant.id)"
                :class="niveau === 'about' ? 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px] text-sky-800' : 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px]'">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                class="feather feather-info iw-14 ih-14">
                <circle cx="12" cy="12" r="10"></circle>
                <line x1="12" y1="16" x2="12" y2="12"></line>
                <line x1="12" y1="8" x2="12.01" y2="8"></line>
            </svg>A propos</Link>
            <Link :href="route('showImage', usersIdentifiant.id)"
                :class="niveau === 'photos' ? 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px] text-sky-800' : 'basis-[30%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px]'">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                class="w-4 h-4">
                <path stroke-linecap="round" stroke-linejoin="round"
                    d="m2.25 15.75 5.159-5.159a2.25 2.25 0 0 1 3.182 0l5.159 5.159m-1.5-1.5 1.409-1.409a2.25 2.25 0 0 1 3.182 0l2.909 2.909m-18 3.75h16.5a1.5 1.5 0 0 0 1.5-1.5V6a1.5 1.5 0 0 0-1.5-1.5H3.75A1.5 1.5 0 0 0 2.25 6v12a1.5 1.5 0 0 0 1.5 1.5Zm10.5-11.25h.008v.008h-.008V8.25Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
            </svg>
            Photos</Link>
            <Link v-if="$page.props.auth.user.id === usersIdentifiant.id" :href="route('myActivity', usersIdentifiant.id)"
                :class="niveau === 'activity' ? 'basis-[35%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px] text-sky-800' : 'basis-[35%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px]'">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                class="feather feather-list iw-14 ih-14">
                <line x1="8" y1="6" x2="21" y2="6"></line>
                <line x1="8" y1="12" x2="21" y2="12"></line>
                <line x1="8" y1="18" x2="21" y2="18"></line>
                <line x1="3" y1="6" x2="3.01" y2="6"></line>
                <line x1="3" y1="12" x2="3.01" y2="12"></line>
                <line x1="3" y1="18" x2="3.01" y2="18"></line>
            </svg>Votre journal</Link>
            <Link v-else :href="route('myActivity', usersIdentifiant.id)"
                :class="niveau === 'activity' ? 'basis-[35%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px] text-sky-800' : 'basis-[35%] flex justify-center items-center gap-2 bg-sky-100 py-1.5 px-2 rounded text-[12px]'">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                class="feather feather-list iw-14 ih-14">
                <line x1="8" y1="6" x2="21" y2="6"></line>
                <line x1="8" y1="12" x2="21" y2="12"></line>
                <line x1="8" y1="18" x2="21" y2="18"></line>
                <line x1="3" y1="6" x2="3.01" y2="6"></line>
                <line x1="3" y1="12" x2="3.01" y2="12"></line>
                <line x1="3" y1="18" x2="3.01" y2="18"></line>
            </svg>Son journal</Link>
        </div>
    </div>

    <div v-if="variable" class="w-full h-full bg-gray-900 bg-opacity-80 top-0 fixed sticky-0 z-50" @click="closeModal">
    </div>
    <transition>
        <div v-if="variable" class="fixed top-0 bg-white h-full w-full z-50">
            <div class="relative">
                <h4 class="border-gray-300 border-b-[1px] text-gray-600 text-[13px] font-bold py-6 px-3.5">Modifier vos informations
                </h4>
                <span class="cursor-pointer absolute top-[25px] right-[10px] border-gray-300 border-[1px] bg-gray-300"
                    @click="closeModal">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="black"
                        class="w-4 h-4">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                    </svg>
                </span>
            </div>
            <section class="w-[90%] mx-auto">
                <div class="flex items-center gap-2 py-3 border-gray-300 border-b-[1px]">
                    <span class="bg-sky-100 rounded p-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none"
                            stroke="gray" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                            class="feather feather-image iw-16 ih-16">
                            <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                            <circle cx="8.5" cy="8.5" r="1.5"></circle>
                            <polyline points="21 15 16 10 5 21"></polyline>
                        </svg>
                    </span>
                    <p class="text-[13px] text-gray-600">Modifier votre photo de profil</p>
                </div>
                <div class="flex items-center gap-2 py-2.5 w-[88%] mx-auto">
                    <img :src="fileProfil === null ? `/storage/images/account.png` : `/storage/profilImage/${fileProfil}`"
                        class="object-cover h-[40px] w-[40px] rounded-lg" alt="image_de_profil">
                    <p class="text-[12px] text-sky-600 cursor-pointer font-bold" @click="chooseFile">Modifier la photo</p>
                </div>
            </section>
        </div>
    </transition>

    <div v-if="variable1" class="w-full h-full bg-gray-900 bg-opacity-80 top-0 fixed sticky-0 z-50" @click="closeModal">
    </div>
    <div v-if="variable1" class="fixed top-0 bg-white h-full w-full z-50">
        <div class="relative">
            <h4 class="border-gray-300 border-b-[1px] text-gray-600 text-sm font-bold py-6 px-3.5">Choisir une photo
            </h4>
            <span class="cursor-pointer absolute top-[25px] right-[10px] border-gray-300 border-[1px] bg-gray-300"
                @click="closeModal1">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="black"
                    class="w-4 h-4">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                </svg>
            </span>
        </div>
        <section class="w-[90%] mx-auto">
            <form @submit.prevent="upload" class="relative h-full">
                <input v-if="nameImg === null" type="file" id="profilFile" @change="imageProfil"
                    class="w-full mt-4 cursor-pointer py-1.5 border-gray-300 border-[1px] rounded-lg px-2" required>

                <div v-if="nameImg" class="mt-4 shadow-2xl border rounded-lg py-4 px-2">
                    <div class="font-bold text-gray-600 text-[12px]">Rendu de l'image</div>
                    <div class="relative mt-2">
                        <img :src="`/storage/profilImage/${nameImg}`" class="object-cover h-[250px] w-full rounded-lg"
                            alt="image_de_profil">
                        <span
                            class="cursor-pointer absolute top-[5px] right-[5px] border-gray-300 border-[1px] bg-gray-300 rounded-full p-1"
                            @click="closeVisual">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                stroke="black" class="w-3 h-3">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                            </svg>
                        </span>
                    </div>
                </div>

                <div
                    class="fixed left-0 bottom-0 right-0 flex justify-end items-center border-gray-300 border-t-[1px] py-4 px-3.5">
                    <button class="bg-sky-600 text-white text-[12px] font-bold py-2 px-3.5 rounded-lg">Charger l'image
                    </button>
                </div>
            </form>

        </section>
    </div>
</template>
<script>
export default {
    props: {
        niveau: String,
        followin: Number,
        followe: Number,
        numberLik: Number,
        covers: String,
        filesProfil: String,
        lastImage: Array,
        usersIdentifiant: Array,
        allImg: Array,
    },
    data() {
        return {
            varBool1: false,
            couverture: this.covers,
            lastImg: this.lastImage,
            variable: false,
            variable1: false,
            nameImg: null,
            fileProfil: this.filesProfil,
            allImgs: this.allImg,
        }
    },

    methods: {
        // Fonction pour afficher toutes les actions que l'utilisateur peut mener sur l'image de sa couverture
        action() {
            this.varBool1 = !this.varBool1;
        },

        // Fonction charger l'image de couverture
        // By KolaDev
        inputFile() {
            let myDataFile = file.files[0];
            let formData = new FormData();
            formData.append("myCover", myDataFile);
            axios.post(route("galleryUser.storeCover"), formData, {
                headers: {
                    "Content-Type": "multipart/form-data",
                },
            }).then(response => {
                if (response.data.success) {
                    this.lastImgCover();
                }
            })
            this.varBool1 = !this.varBool1;
        },

        // Fonction pour récupérer la dernière image de couverture de l'utilisateur
        lastImgCover() {
            axios.get(route("lastImgCover")).then(response => {
                this.couverture = response.data.cover;
                this.lastImg = response.data.getLastImg;
                this.fileProfil = response.data.profil;
                this.allImgs = response.data.getLastImgProfil;
            })
        },

        // Fonction pour supprimer l'image de couverture
        // By KolaDev
        deleteCover() {
            this.varBool1 = !this.varBool1;
            axios.delete(route("deleteCover", {
                tableau: this.lastImg
            })).then(response => {
                if (response.data.success) {
                    this.lastImgCover();
                } else {
                    console.log(response.data.error);
                }
            })
        },

        // Fonction pour afficher le modal
        // By KolaDev
        openModal() {
            this.variable = !this.variable;
        },

        // Fonction pour cacher le modal
        // By KolaDev
        closeModal() {
            this.variable = !this.variable;
        },

        // Fonction pour afficher le modal de chargement d'image
        // By KolaDev
        chooseFile() {
            this.variable = !this.variable;
            this.variable1 = !this.variable1;
        },

        // Fonction pour fermer le modal de chargement d'image
        // By KolaDev
        closeModal1() {
            this.variable1 = !this.variable1;
            if (this.nameImg) {
                this.closeVisual();
            }
        },

        // Fonction pour ajouter l'image dans la bdd
        // By KolaDev
        upload() {
            axios.post(route("uploadImgUser", {
                nameImg: this.nameImg
            })).then(response => {
                if (response.data.success) {
                    this.nameImg = null;
                    this.variable = !this.variable;
                    this.variable1 = !this.variable1;
                    this.lastImgCover();
                }
            })
        },

        // Fonction pour charger l'image
        // By KolaDev
        imageProfil() {
            let myDataFile = profilFile.files[0];
            let formData = new FormData();
            formData.append("myPicture", myDataFile);
            axios.post(route("galleryUser.store"), formData, {
                headers: {
                    "Content-Type": "multipart/form-data",
                },
            }).then(response => {
                if (response.data.success) {
                    profilFile.value = null;
                    this.nameImg = response.data.nameImg;
                } else {
                    console.log(response.data.error);
                }
            })
        },

        // Fonction pour supprimer l'image
        // By KolaDev
        closeVisual() {
            axios.delete(route("deleteImage", {
                nameImg: this.nameImg
            })).then(response => {
                if (response.data.success) {
                    this.nameImg = null;
                } else {
                    console.log(response.data.error);
                }
            })
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