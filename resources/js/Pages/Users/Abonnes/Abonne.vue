<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import ComposantUser from '@/Composables/UserComposant.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Abonnements" />
    <AuthenticatedLayout>
        <main class="mt-[-20px]">
            <ComposantUser :filesProfil="profil" :covers="cover" :lastImage="lImg" :niveau="'friends'"
                :followin="userfollow" :followe="followers" :usersIdentifiant="user" :numberLik="numberLike"
                :allImg="getLastImgProfil" />
            <section class="bg-white mt-[13px] mb-8 pb-8">
                <div class="border-[#e4e7e9e5] border-b-[1px]">
                    <div class="px-2 py-4 flex justify-between items-center mx-auto w-[90%]">
                        <div class="flex gap-4 basis-[50%]">
                            <button class="font-bold text-[13px] text-sky-600" id="amis"
                                v-if="$page.props.auth.user.id === user.id">Vos abonnées</button>
                            <button class="font-bold text-[13px] text-sky-600" id="amis" v-else>Ses abonnées</button>
                        </div>
                    </div>
                </div>
                <div class="w-[90%] m-auto mt-2">
                    <form class="basis-[45%] bg-[#e4e7e9e5] pr-2 flex items-center gap-2 rounded-lg border">
                        <input type="text" placeholder="Recherchez un proche..."
                            class="text-sm w-full focus:ring-0 focus:ring-transparent py-1 bg-[#e4e7e9e5] border-none outline-none rounded placeholder:text-[12px]"
                            @input="searchInputFriend(user.uuid)" v-model="search">
                        <span class="cursor-pointer" @click="resetSearch">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                stroke="currentColor" class="w-4 h-4">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                            </svg>
                        </span>
                    </form>
                </div>

                <div id="divAmis" class="mx-auto w-[88%] mt-4 flex flex-col gap-y-2 max-h-[500px] overflow-y-auto">
                    <article class="basis-full flex items-center justify- borderFollow py-2"
                        v-for="(el, index) in userfollowing" :key="index">
                        <div class="flex items-center gap-2 basis-[70%]">
                            <div class="border-sky-600 border-l-4 rounded-full">
                                <div class="rounded-full border-white border-4">
                                    <img v-if="el.image" :src="`/storage/profilImage/${el.image}`"
                                        class="object-cover h-[30px] w-[30px] rounded-full" alt="image_de_profil">
                                    <img v-else :src="`/storage/images/account.png`"
                                        class="object-cover h-[30px] w-[30px] rounded-full" alt="image_de_profil">
                                </div>
                            </div>
                            <div class="flex flex-col mt-[-5px]">
                                <Link :href="route('myActivity', el.id)" class="text-gray-800 text-[12px] font-bold">{{
                                    el.name }}</Link>
                                <p v-if="el.abonne !== null" class="text-gray-400 font-medium text-[11px]">Depuis le {{
                                    el.abonne.split("T")[0] }}</p>
                                <p v-else class="text-gray-400 font-medium text-[11px]">Depuis le {{
                                    el.created_at.split("T")[0] }}</p>
                            </div>
                        </div>
                        <div class="basis-[30%]" v-if="$page.props.auth.user.id === user.id">
                            <div class="flex justify-end gap-2 basis-full" v-if="el.lier !== null">
                                <button
                                    class="basis-full rounded-lg py-1.5 px-1 bg-white border-sky-500 border-[1px] text-sky-500 hover:bg-white font-bold text-[10px]">Vous
                                    êtes abonnés</button>
                            </div>
                            <div class="flex justify-end gap-2 basis-full" v-else>
                                <button @click="followingAction(el.id, user.uuid)"
                                    class="basis-full rounded-lg py-1.5 px-1 bg-[#0389c9] text-white hover:text-sky-500 hover:bg-white font-bold text-[10px]">Suivre
                                    en retour</button>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
        </main>
    </AuthenticatedLayout>
</template>

<style>
/* .borderFollow:nth-of-type(2n)
{
    border-block: 1px solid #d8dbdf;
} */
</style>

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
        }
    },

    methods: {
        // Fonction pour récupérer tous ceux qui sont abonnés à l'utilisateur
        // By KolaDev
        getAbonnees(uuid) {
            axios.post(route("getAbonnees", {
                uuid: uuid
            })).then(response => {
                this.userfollowing = response.data.userFollowing;
                this.users = response.data.follow;
                this.userfollow = response.data.following;
                this.followers = response.data.follower;
                this.numberLike = response.data.countLike;
                this.search = null;
            })
        },

        // Fonction pour suivre un utilisateur
        // By KolaDev
        followingAction(id, uuid) {
            axios.post(route("followingUser", {
                id: id
            })).then(response => {
                if (response.data.success) {
                    this.getAbonnees(uuid);
                }
            })
        },

        // Fonction pour rechercher des amis
        // By KolaDev
        searchInputFriend(uuid) {
            axios.post(route("searchInputFriendAbonnees", {
                search: this.search,
                uuid: uuid
            })).then(response => {
                this.userfollowing = response.data;
            })
        },

        // Fonction pour vider le champ de recherche
        // By KolaDev
        resetSearch() {
            this.search = null;
        }
    },

}

</script>