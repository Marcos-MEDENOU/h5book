<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import ComposantUser from '@/Composables/UserComposant.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Friends" />
    <AuthenticatedLayout>
        <main class="mt-[-20px]">
            <ComposantUser :filesProfil="profil" :covers="cover" :lastImage="lImg" :niveau="'friends'"
                :followin="userfollow" :followe="followers" :usersIdentifiant="user" :numberLik="numberLike" />
            <section class="bg-white mt-[13px] mb-8 pb-8">
                <div class="border-[#e4e7e9e5] border-b-[1px]">
                    <div class="px-2 py-4 flex justify-between items-center mx-auto w-[90%]">
                        <div class="flex gap-4 basis-[50%]">
                            <button class="font-bold text-[15px] text-sky-600" @click="friend()" id="amis">Amis</button>
                            <button class="font-bold text-[15px] text-gray-600" @click="suggest()"
                                id="suggest">Suggestions</button>
                        </div>
                        <form class="basis-[45%] bg-[#e4e7e9e5] pr-2 flex items-center gap-2 rounded-lg border">
                            <input type="text" placeholder="Recherchez un proche..."
                                class="text-sm w-full focus:ring-0 focus:ring-transparent py-1 bg-[#e4e7e9e5] border-none outline-none rounded"
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

                <div id="divAmis" class="mx-auto w-[88%] mt-4 flex flex-col gap-y-6 max-h-[500px] overflow-y-auto">
                    <article class="basis-full flex flex-col border-gray-500 border-b-[1px] pb-2" v-for="(user, index) in userfollowing"
                        :key="index">
                        <div class="flex items-center gap-2">
                            <div class="border-sky-600 border-l-4 rounded-full">
                                <div
                                    class="rounded-full border-white border-4">
                                    <img v-if="user.image" :src="`/storage/profilImage/${user.image}`"
                                        class="object-cover h-[50px] w-[50px] rounded-full" alt="image_de_profil">
                                    <img v-else :src="`/storage/images/easy.png`"
                                        class="object-cover h-[50px] w-[50px] rounded-full" alt="image_de_profil">
                                </div>
                            </div>
                            <div class="flex flex-col mt-[-5px]">
                                <Link :href="route('myActivity', user.id)" class="text-gray-800 font-bold">{{ user.name }}</Link>
                                <p v-if="user.abonne !== null" class="italic text-gray-400 font-bold text-[12px]">Abonné depuis le {{ user.abonne.split("T")[0] }}</p>
                            </div>
                        </div>
                        <div class="flex justify-end gap-2">
                            <button @click="unsubscribe(user.id)"
                                class="basis-[30%] rounded-lg text-gray-600 font-bold border-gray-500 border-[1px] py-1.5 bg-gray-100 text-[12px]">Se désabonner</button>
                        </div>
                    </article>
                </div>

                <div id="divSuggest" class="hidden mx-auto w-[88%] mt-4 flex flex-col  gap-y-8 max-h-[500px] overflow-y-auto">
                    <article class="basis-full flex flex-col border-gray-500 border-b-[1px] pb-2" v-for="(following, index) in users"
                        :key="index">
                        <div class="flex gap-2">
                            <div class="border-sky-600 border-l-4 rounded-full">
                                <div
                                    class="rounded-full border-white border-4">
                                    <img v-if="following.image" :src="`/storage/profilImage/${following.image}`"
                                        class="object-cover h-[50px] w-[50px] rounded-full" alt="image_de_profil">
                                    <img v-else :src="`/storage/images/easy.png`"
                                        class="object-cover h-[50px] w-[50px] rounded-full" alt="image_de_profil">
                                </div>
                            </div>
                            <div class="flex flex-col mt-[5px]">
                                <Link :href="route('myActivity', following.id)" class="text-gray-800 font-bold">{{ following.name }}</Link>
                                <p v-if="following.created_at !== null" class="italic text-gray-400 font-bold text-[12px]">Inscrit depuis le {{ following.created_at.split("T")[0] }}</p>
                            </div>
                        </div>
                        <div class="flex justify-end">
                            <button @click="followingAction(following.id)"
                                class="basis-[30%] rounded-lg py-1.5 px-5 bg-[#0389c9] text-white hover:text-sky-500 hover:bg-white font-bold border-sky-500 border-[1px] text-[12px]">Suivre</button>
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
        countLike: Number,
        follower: Number,
        cover: String,
        lImg: Array,
        profil: String,
        getLastImgProfil: Array,
        user: Array,
    },

    data() {
        return {
            varBool: false,
            users: this.follow,
            userfollow: this.following,
            userfollowing: this.userFollowing,
            followers: this.follower,
            search: null,
            numberLike: this.countLike,
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
            this.resetSearch();
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
            this.resetSearch();
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