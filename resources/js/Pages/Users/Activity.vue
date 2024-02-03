<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import ComposantUser from '@/Composables/UserComposant.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Voir mes activités" />
    <AuthenticatedLayout>
        <main class="mt-[-20px]">
            <ComposantUser :filesProfil="imageProfil" :covers="couverture" :lastImage="thisImage" :niveau="'activity'"
                :followin="userfollow" :followe="followers" :usersIdentifiant="users" :numberLik="numberLike" />

            <section class="my-4 bg-white py-1">
                <div class="flex flex-col">
                    <div v-for="(el, index) in allFiles" :key="index" class="border-b-[1px] pb-2 shadow-sm">
                        <div class="mt-[20px] flex items-center gap-2 px-2">
                            <img :src="`/storage/profilImage/${getLastImgProfil.file_profile}`" alt="image_de_profil"
                                class="rounded-full w-[50px] h-[50px]">
                            <div>
                                <h3 class="font-bold text-gray-700">{{ el.name }}</h3>
                                <p class="italic text-[12px] text-gray-600 font-bold">Publié le {{
                                    el.created_at.split("T")[0] }}</p>
                            </div>
                        </div>
                        <div class="mt-[20px] w-[90%] mx-auto"
                            @click="viewPostProfil(getLastImgProfil.user_id, el.id)">
                            <img :src="`/storage/profilImage/${el.file_profile}`" alt="image_de_profil"
                                class="w-full h-[380px] rounded">
                        </div>
                        <div class="w-[90%] mx-auto mt-[1px] cursor-pointer hover:bg-sky-100 px-1 rounded"
                            v-if="el.likes > 0">
                            <span v-if="el.trueVariable && el.likes > 1" class="text-gray-600 text-sm">Vous et {{ el.likes -
                                1 }} autre(s)
                                personne(s) ont aimé cette
                                photo.</span>
                            <span v-else-if="el.trueVariable && el.likes == 1" class="text-gray-600 text-sm">Vous avez aimé
                                cette
                                photo.</span>
                            <span v-else class="text-gray-600 text-sm">{{ el.likes }} personne(s) ont aimé cette
                                photo.</span>
                        </div>
                        <div class="mt-2 flex w-[90%] mx-auto justify-between items-center">
                            <span
                                class="basis-[48%] flex justify-center border-gray-400 border-[1px] rounded-2xl p-1.5 cursor-pointer gap-2 items-center"
                                @click="clickLike(el)">
                                <span v-if="el.trueVariable === false" class="flex gap-2 items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="gray" class="w-5 h-5">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z" />
                                    </svg>
                                    <span class="text-gray-600">{{ el.likes }}</span>
                                </span>
                                <span v-else class="flex gap-2 items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="#0080FF" class="w-5 h-5">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z" />
                                    </svg>
                                    <span class="text-gray-600 text-sm">{{ el.likes }}</span>
                                </span>
                            </span>
                            <span
                                class="basis-[48%] flex justify-center p-1 cursor-pointer gap-2 items-center border-gray-400 border-[1px] rounded-2xl"
                                @click="viewPostProfil(getLastImgProfil.user_id, el.id)">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="gray" class="w-5 h-5">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z" />
                                </svg>
                                <span class="text-gray-600">{{ el.comments }}</span>
                            </span>
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
        countLike: Number,
        follower: Number,
        cover: String,
        lImg: Array,
        profil: String,
        getLastImgProfil: Array,
        allFilesProfils: Array,
        user: Array,
    },

    data() {
        return {
            varBool: false,
            users: this.user,
            userfollow: this.following,
            followers: this.follower,
            numberLike: this.countLike,
            allFiles: this.allFilesProfils,
            comment: null,
            couverture: this.cover,
            imageProfil: this.profil,
            thisImage: this.lImg,
        }
    },

    methods: {
        // By KolaDev
        viewPostProfil(user_id, id) {
            window.location.href = `/postProfil/${user_id}/${id}`
        },

        // By KolaDev
        keyUpComment() {
            if (event.key === 'Enter') {
                // Empêche le saut de ligne par défaut
                event.preventDefault();
            }
            // if(event.key === 'Enter' && event.shiftKey)
            // {
            //     console.log(this.comment);
            // }
        },

        // By KolaDev
        clickLike(el) {
            axios.post(route("addLikeFile"), {
                image: el
            }).then(response => {
                if (response.data.success) {
                    this.alFil();
                }
            })
        },

        // By KolaDev
        alFil() {
            axios.post(route("allFilPro"), {
                user: this.user.id
            }).then(response => {
                this.allFiles = response.data.allFilesProfils;
                this.numberLike = response.data.countLike;
                this.followers = response.data.follower;
                this.userfollow = response.data.following;
                this.users = response.data.user;
                this.couverture = response.data.cover;
                this.imageProfil = response.data.profil;
                this.thisImage = response.data.lImg;
            })
        }
    },

}

</script>