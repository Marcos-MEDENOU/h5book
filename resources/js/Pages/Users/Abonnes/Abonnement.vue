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
                :followin="userfollow" :followe="followers" :usersIdentifiant="user" :numberLik="numberLike" :allImg="getLastImgProfil" />
            <section class="bg-white mt-[13px] mb-8 pb-8">
                <div class="border-[#e4e7e9e5] border-b-[1px]">
                    <div class="px-2 py-4 flex justify-between items-center mx-auto w-[90%]">
                        <div class="flex gap-4 basis-[50%]">
                            <button class="font-bold text-[13px] text-sky-600" v-if="$page.props.auth.user.id === user.id" @click="friend(user.uuid)" id="amis">Amis</button>

                            <button class="font-bold text-[13px] text-sky-600" v-else @click="friend(user.uuid)" id="amis">Ses amis</button>

                            <button v-if="$page.props.auth.user.id === user.id" class="font-bold text-[13px] text-gray-600" @click="suggest(user.uuid)"
                                id="suggest">Suggestions</button>
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
                    <article class="basis-full flex items-center justify- borderFollow py-2" v-for="(el, index) in userfollowing"
                        :key="index" :id="'parent-' + el.id">
                        <div class="flex items-center gap-2 basis-[70%]">
                            <div class="border-sky-600 border-l-4 rounded-full">
                                <div
                                    class="rounded-full border-white border-4">
                                    <img v-if="el.image" :src="`/storage/profilImage/${el.image}`"
                                        class="object-cover h-[30px] w-[30px] rounded-full" alt="image_de_profil">
                                    <img v-else :src="`/storage/images/account.png`"
                                        class="object-cover h-[30px] w-[30px] rounded-full" alt="image_de_profil">
                                </div>
                            </div>
                            <div class="flex flex-col mt-[-5px]">
                                <Link :href="route('myActivity', el.id)" class="text-gray-800 text-[12px] font-bold">{{ el.name }}</Link>
                                <p v-if="el.abonne !== null" class="text-gray-400 font-medium text-[11px]">Depuis le {{ el.abonne.split("T")[0] }}</p>
                            </div>
                        </div>
                        <div class="flex justify-end gap-2 basis-[30%]" v-if="$page.props.auth.user.id === user.id">
                            <button @click="unsubscribe(el.id, index)"
                                class="basis-full rounded-lg text-white font-bold border-gray-500 py-1.5 bg-[#fc6949] text-[11px]">Ne plus suivre</button>
                        </div>
                    </article>
                </div>

                <div id="divSuggest" class="hidden mx-auto w-[88%] mt-4 flex flex-col gap-y-2 max-h-[500px] overflow-y-auto">
                    <article class="basis-full flex items-center justify- borderFollow py-2" v-for="(following, index) in users"
                        :key="index">
                        <div class="flex gap-2 basis-[70%]">
                            <div class="border-sky-600 border-l-4 rounded-full">
                                <div
                                    class="rounded-full border-white border-4">
                                    <img v-if="following.image" :src="`/storage/profilImage/${following.image}`"
                                        class="object-cover h-[30px] w-[30px] rounded-full" alt="image_de_profil">
                                    <img v-else :src="`/storage/images/account.png`"
                                        class="object-cover h-[30px] w-[30px] rounded-full" alt="image_de_profil">
                                </div>
                            </div>
                            <div class="flex flex-col mt-[5px]">
                                <Link :href="route('myActivity', following.id)" class="text-gray-800 text-[12px] font-bold">{{ following.name }}</Link>
                                <p v-if="following.created_at !== null" class="text-gray-400 font-medium text-[11px]">Depuis le {{ following.created_at.split("T")[0] }}</p>
                            </div>
                        </div>
                        <div class="flex justify-end basis-[30%]" v-if="$page.props.auth.user.id === user.id">
                            <button @click="followingAction(following.id, index)"
                                class="basis-full rounded-lg py-1.5 px-5 bg-[#0389c9] text-white hover:text-sky-500 hover:bg-white font-bold text-[11px]">Suivre</button>
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
            variableDependance: 'friends',
        }
    },

    methods: {
        // Fonction pour afficher tous les amis de l'utilisateur connecté
        // By KolaDev
        friend(uuid) {
            suggest.classList.remove("text-sky-600");
            suggest.classList.add("text-gray-600");
            amis.classList.remove("text-gray-600");
            amis.classList.add("text-sky-600");
            divAmis.classList.remove("hidden");
            divSuggest.classList.add("hidden");
            this.variableDependance = "friends";
            this.resetSearch(uuid);
        },

        // Fonction pour suggérer des amis à l'utilisateur connecté
        // By KolaDev
        suggest(uuid) {
            amis.classList.remove("text-sky-600");
            amis.classList.add("text-gray-600");
            suggest.classList.remove("text-gray-600");
            suggest.classList.add("text-sky-600");
            divAmis.classList.add("hidden");
            divSuggest.classList.remove("hidden");
            this.variableDependance = "suggestion";
            this.resetSearch(uuid);
        },

        // Fonction pour afficher les amis de l'utilisateur connecté
        // By KolaDev
        getFollowers(uuid) {
            axios.get(route("getFollowers", {
                uuid: uuid
            })).then(response => {
                this.users = response.data.follow;
                this.userfollow = response.data.following;
                this.userfollowing = response.data.userFollowing;
                this.followers = response.data.follower;
            })
        },

        // Fonction pour suivre un utilisateur
        // By KolaDev
        followingAction(id, index) {
            axios.post(route("followingUser", {
                id: id
            })).then(response => {
                if (response.data.success) {
                    setTimeout(() => {
                        this.users.splice(index, 1);
                    }, 1000)
                } else {
                    console.log(response.data.error);
                }
            })
        },

        // Fonction pour se désabonner d'un utilisateur
        // By KolaDev
        unsubscribe(id, index) {
            axios.delete(route("unsubscribe", {
                id: id
            })).then(response => {
                if (response.data.success) {
                    setTimeout(() => {
                        this.userfollowing.splice(index, 1);
                    }, 1000)
                } else {
                    console.log(response.data.error);
                }
            })
        },

        // Fonction pour rechercher des amis
        // By KolaDev
        searchInputFriend(uuid) {
            axios.post(route("searchInputFriend", {
                search: this.search,
                variable: this.variableDependance,
                uuid: uuid
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
        resetSearch(uuid) {
            this.search = null;
            this.getFollowers(uuid);
        }
    },

}

</script>