<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import ComposantUser from '@/Composables/UserComposant.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Friends" />
    <AuthenticatedLayout>
        <main class="mt-[-20px]">
            <ComposantUser :niveau="'friends'" :followin="userfollow" :followe="followers" />
            <section class="bg-white mt-[13px] mb-8 pb-8">
                <div class="border-[#e4e7e9e5] border-b-[1px]">
                    <div class="px-2 py-4 flex justify-between items-center mx-auto w-[90%]">
                        <div class="flex gap-4 basis-[50%]">
                            <button class="font-bold text-[15px] text-sky-600" @click="friend()" id="amis">Amis</button>
                            <button class="font-bold text-[15px] text-gray-600" @click="suggest()"
                                id="suggest">Suggestions</button>
                        </div>
                        <form class="basis-[35%] bg-[#e4e7e9e5] pr-2 flex items-center gap-2 rounded-lg border">
                            <input type="text" placeholder="Recherchez un proche..."
                                class="text-sm w-full py-1 bg-[#e4e7e9e5] border-none outline-none rounded"
                                @input="searchInputFriend" v-model="search">
                            <span class="cursor-pointer" @click="resetSearch">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="currentColor" class="w-4 h-4">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                                </svg>
                            </span>

                        </form>
                    </div>
                </div>

                <div id="divAmis" class="mx-auto w-[85%] mt-4 flex justify-between flex-wrap gap-y-8">
                    <article class="w-[45%] flex flex-col items-center gap-2" v-for="(user, index) in userfollowing"
                        :key="index">
                        <div class="border-sky-600 border-l-4 rounded-full">
                            <div
                                class="bg-[url('/storage/images/img.webp')] bg-center bg-no-repeat bg-cover h-[70px] w-[70px] rounded-full border-white border-4">
                            </div>
                        </div>
                        <div class="flex flex-col items-center">
                            <h3 class="text-gray-800 font-bold">{{ user.name }}</h3>
                            <p class="text-[12px] text-gray-600">{{ user.email }}</p>
                        </div>
                        <div class="mt-2 flex flex-col gap-2">
                            <button @click="unsubscribe(user.id)"
                                class="w-full rounded-lg py-1.5 px-5 hover:bg-[#0389c9] hover:text-white text-sky-500 font-bold border-sky-500 border-[1px] text-[14px]">Ne
                                plus suivre</button>
                            <button
                                class="w-full rounded-lg py-1.5 px-5 hover:bg-[#0389c9] hover:text-white text-sky-500 font-bold border-sky-500 border-[1px] text-[14px]">Voir
                                le profil</button>
                        </div>
                    </article>
                </div>

                <div id="divSuggest" class="hidden mx-auto w-[85%] mt-4 flex justify-between flex-wrap gap-y-8">
                    <article class="w-[45%] flex flex-col items-center gap-2" v-for="(following, index) in users"
                        :key="index">
                        <div class="border-sky-600 border-l-4 rounded-full">
                            <div
                                class="bg-[url('/storage/images/img.webp')] bg-center bg-no-repeat bg-cover h-[70px] w-[70px] rounded-full border-white border-4">
                            </div>
                        </div>
                        <div class="flex flex-col items-center">
                            <h3 class="text-gray-800 font-bold">{{ following.name }}</h3>
                            <p class="text-[12px] text-gray-600">{{ following.email }}</p>
                        </div>
                        <div class="mt-2 flex flex-col gap-2">
                            <button @click="followingAction(following.id)"
                                class="w-full rounded-lg py-1.5 px-5 hover:bg-[#0389c9] hover:text-white text-sky-500 font-bold border-sky-500 border-[1px] text-[14px]">Suivre</button>
                            <button
                                class="w-full rounded-lg py-1.5 px-5 hover:bg-[#0389c9] hover:text-white text-sky-500 font-bold border-sky-500 border-[1px] text-[14px]">Voir
                                le profil</button>
                        </div>
                    </article>
                </div>
            </section>
        </main>
    </AuthenticatedLayout>
</template>

<script>
export default {
    props: {
        follow: Array,
        userFollowing: Array,
        following: Number,
        follower: Number,
    },

    data() {
        return {
            varBool: false,
            users: this.follow,
            userfollow: this.following,
            userfollowing: this.userFollowing,
            followers: this.follower,
            search: null,
            variableDependance: 'friends',
        }
    },

    methods: {
        // Fonction pour afficher tous les amis de l'utilisateur connecté
        // By KolaDev
        friend() {
            suggest.classList.remove("text-sky-600");
            suggest.classList.add("text-gray-600");
            amis.classList.remove("text-gray-600");
            amis.classList.add("text-sky-600");
            divAmis.classList.remove("hidden");
            divSuggest.classList.add("hidden");
            this.variableDependance = "friends";
        },

        // Fonction pour suggérer des amis à l'utilisateur connecté
        // By KolaDev
        suggest() {
            amis.classList.remove("text-sky-600");
            amis.classList.add("text-gray-600");
            suggest.classList.remove("text-gray-600");
            suggest.classList.add("text-sky-600");
            divAmis.classList.add("hidden");
            divSuggest.classList.remove("hidden");
            this.variableDependance = "suggestion";
        },

        // Fonction pour afficher les amis de l'utilisateur connecté
        // By KolaDev
        getFollowers() {
            axios.get(route("getFollowers")).then(response => {
                this.users = response.data.follow;
                this.userfollow = response.data.following;
                this.userfollowing = response.data.userFollowing;
                this.followers = response.data.follower;
            })
        },

        // Fonction pour suivre un utilisateur
        // By KolaDev
        followingAction(id) {
            axios.post(route("followingUser", {
                id: id
            })).then(response => {
                if (response.data.success) {
                    this.getFollowers();
                } else {
                    console.log(response.data.error);
                }
            })
        },

        // Fonction pour se désabonner d'un utilisateur
        // By KolaDev
        unsubscribe(id) {
            axios.delete(route("unsubscribe", {
                id: id
            })).then(response => {
                if (response.data.success) {
                    this.getFollowers();
                } else {
                    console.log(response.data.error);
                }
            })
        },

        // Fonction pour rechercher des amis
        // By KolaDev
        searchInputFriend() {
            axios.post(route("searchInputFriend", {
                search: this.search,
                variable: this.variableDependance
            })).then(response => {
                if (this.variableDependance === 'friends') {
                    this.userfollowing = response.data.userFollowing;
                } else {
                    this.users = response.data.follow;
                }
            })
        },

        // Fonction pour vider le champ de recherche
        // By KolaDev
        resetSearch() {
            this.search = null;
            this.getFollowers();
        }
    },

}

</script>