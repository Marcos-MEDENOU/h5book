<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import ComposantUser from '@/Composables/UserComposant.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Friends" />
    <AuthenticatedLayout>
        <main class="mt-[-20px]">
            <section class="mx-auto w-[92%]">
                <div class="flex justify-between items-center">
                    <div class="mt-[20px] flex items-center gap-2">
                        <img :src="`/storage/profilImage/${lastImage.file_profile}`" alt="image_de_profil"
                            class="rounded-full w-[50px] h-[50px]">
                        <div>
                            <h3 class="font-bold text-gray-700">{{ users.name }}</h3>
                            <p class="italic text-[12px] text-gray-600 font-bold">Publié le {{
                                image.created_at.split("T")[0] }}</p>
                        </div>
                    </div>

                    <div class="relative" v-if="users.id === $page.props.auth.user.id">
                        <span class="cursor-pointer">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                stroke="currentColor" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M6.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM12.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM18.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                            </svg>
                        </span>
                    </div>
                </div>

                <div class="mt-[20px] w-[90%] mx-auto">
                    <img :src="`/storage/profilImage/${image.file_profile}`" alt="image_de_profil"
                        class="w-full h-[380px] rounded">
                </div>

                <div class="w-[90%] mx-auto mt-2 cursor-pointer hover:bg-sky-100 p-1 rounded" v-if="number > 0" @click="openParticipant">
                    <span v-if="varBool && number > 1" class="text-gray-600 text-sm">Vous et {{ number - 1 }} autre(s) personne(s) ont aimé cette
                        photo.</span>
                    <span v-else-if="varBool && number == 1" class="text-gray-600 text-sm">Vous avez aimé cette
                        photo.</span>
                    <span v-else class="text-gray-600 text-sm">{{ number }} personne(s) ont aimé cette
                        photo.</span>
                </div>
                <div class="mt-2 flex border-gray-400 border-t-[1px]">
                    <span
                        class="basis-[50%] flex justify-center border-gray-400 border-r-[1px] py-2 px-1 cursor-pointer gap-2 items-center"
                        @click="clickLike">
                        <span v-if="varBool === false" class="flex gap-2 items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                stroke="gray" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z" />
                            </svg>
                            <span class="text-gray-600">{{ number }}</span>
                        </span>
                        <span v-else class="flex gap-2 items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                stroke="#0080FF" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z" />
                            </svg>
                            <span class="text-gray-600 text-sm">{{ number }}</span>
                        </span>
                    </span>
                    <span class="basis-[50%] flex justify-center py-2 px-1 cursor-pointer gap-2 items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="gray" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z" />
                        </svg>
                        <span class="text-gray-600">0</span>
                    </span>
                </div>

                <transition>
                    <div v-if="varPar" class="z-40 bg-white fixed bottom-0 left-0 right-0 rounded-l-lg rounded-r-lg">
                        <div class="relative text-center text-gray-600 text-sm font-bold py-3 border-gray-300 border-b-[1px] mb-2">
                            <h4>Tous les participants</h4>
                            <span
                                class="cursor-pointer absolute top-[10px] right-[5px] border-gray-300 border-[1px] bg-gray-300 rounded p-1"
                                @click="closeParticipant">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="black" class="w-3 h-3">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                                </svg>
                            </span>
                        </div>
                        <div class="max-h-[400px] overflow-y-auto">
                            <div class="mx-auto w-[90%] flex flex-col gap-y-2 mb-2">
                                <div v-for="(el, index) in userLike" class="cursor-pointer hover:bg-sky-100 py-1 px-2 hover:rounded flex justify-between items-center border-gray-300 border-b-[1px]">
                                    <div class="flex items-center gap-2">
                                        <img :src="`/storage/profilImage/${el.image}`" alt="image_de_profil"
                                            class="w-[50px] h-[50px] rounded-full">
                                        <h5 class="font-bold text-gray-700 text-sm">{{ el.name }}</h5>
                                    </div>
                                    <div>
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                            stroke-width="1.5" stroke="gray" class="w-6 h-6">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z" />
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </transition>

                <div class="bg-white fixed bottom-0 left-0 right-0 rounded-l-lg rounded-r-lg py-2">
                    <div class="flex justify-center mx-auto w-[90%]">
                        <form @submit.prevent="formComment" class="flex items-center justify-between basis-full">
                            <textarea cols="30" class="py-0 resize-none h-[30px] rounded-full basis-[92%]" placeholder="Laisser un commentaire"></textarea>
                            <button><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="#0080FF" class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5" />
</svg>
</button>
                        </form>
                    </div>
                </div>
            </section>
        </main>
    </AuthenticatedLayout>
</template>

<script>
export default {
    props: {
        file: Array,
        infoUser: Array,
        last: Array,
        trueVariable: Boolean,
        countLike: Number,
        userlike: Array
    },

    data() {
        return {
            image: this.file,
            users: this.infoUser,
            lastImage: this.last,
            number: this.countLike,
            varBool: this.trueVariable,
            userLike: this.userlike,
            varPar: false,
        }
    },

    methods: {
        // Fonction pour ajouter des likes
        // By KolaDev
        clickLike() {
            axios.post(route("addLikeFile", {
                image: this.image
            })).then(response => {
                if (response.data.success) {
                    this.allLikeByImage();
                }
            })
        },

        // Fonction pour récupérer tous les likes
        // By KolaDev
        allLikeByImage() {
            axios.post(route("allLikeFile", {
                image: this.image
            })).then(response => {
                this.number = response.data.number;
                this.varBool = response.data.variable;
                this.userLike = response.data.userLike;
            })
        },

        // 
        // By KolaDev
        openParticipant()
        {
            this.varPar = !this.varPar;
        },

        // 
        // By KolaDev
        closeParticipant()
        {
            this.varPar = !this.varPar;
        }
    }
}

</script>