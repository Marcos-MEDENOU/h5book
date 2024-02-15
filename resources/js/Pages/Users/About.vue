<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import ComposantUser from '@/Composables/UserComposant.vue';
import { Head, Link } from '@inertiajs/vue3';
</script>

<template>
    <Head title="Friends" />
    <AuthenticatedLayout>
        <main class="mt-[-20px]">
            <ComposantUser :niveau="'about'"  :filesProfil="imageProfil" :covers="couverture" :lastImage="thisImage"
                :followin="userfollow" :followe="followers" :usersIdentifiant="users" :numberLik="numberLike" :allImg="getLastImgProfil" />

                <section class="mt-4 bg-white max-w-[90%] m-auto rounded">
                    <div class="flex items-center justify-between py-3.5 px-5 border-b-[1px]">
                        <h2><span class="text-[17px] font-bold">A propos de </span><span class="text-[14px]">Moi</span></h2>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 icon icon-dark stroke-width-3 iw-11 ih-11"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                        </div>
                    </div>
                    <div>
                        <div class="flex items-center justify-between gap-6 px-5 py-6">
                            <div class="bg-sky-100 p-1.5 rounded">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user iw-18 ih-18"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                            </div>
                            <div>
                                <h4 class="font-bold text-sm">Ma bibliographie</h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero consequuntur doloremque veniam ipsa a inventore at nulla similique dicta veritatis!</p>
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
        user: Array,
    },

    data() {
        return {
            varBool: false,
            users: this.user,
            userfollow: this.following,
            followers: this.follower,
            numberLike: this.countLike,
            couverture: this.cover,
            imageProfil: this.profil,
            thisImage: this.lImg,
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