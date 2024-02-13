<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import ComposantUser from "@/Composables/UserComposant.vue";
import { Head, Link } from "@inertiajs/vue3";
</script>

<template>
  <Head title="Publication" />
  <AuthenticatedLayout>
    <main class="mt-[-20px]">
      <section>
        <div class="bg-white relative border-gray-400 border-b-[1px]">
          <div class="flex justify-between items-center">
            <div class="flex items-center justify-between">
              <div class="flex items-center gap-2 px-2 py-1">
                    <img :src="post.image_user !== null
                      ? `/storage/profilImage/${post.image_user}`
                      : `/storage/images/easy.png`
                      " alt="image_de_profil" class="rounded-full w-[60px] h-[50px]" />
                    <div>
                      <h3 class="text-[12px] flex flex-wrap items-center gap-x-2 font-bold text-gray-700"
                        v-if="post.tagged_names !== null && $page.props.auth.user.id == post.tagged_names.split('-')[0]">
                        <Link :href="route('myActivity', post.user_id)">{{ post.creator_name }}</Link> <svg
                          xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                          stroke="currentColor" class="w-3 h-3">
                          <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                        </svg>
                        <Link :href="route('myActivity', post.tagged_names.split('-')[0])">{{ post.tagged_names.split('-')[1] }}
                        </Link>
                      </h3>
                      <h3 class="text-[12px] flex flex-wrap items-center gap-x-2 font-bold text-gray-700" v-else>
                        <Link :href="route('myActivity', post.user_id)">{{ post.creator_name }}</Link>
                        <p class="text-[12px] flex flex-wrap items-center gap-x-1" v-if="post.tagged_names !== null"><svg
                            xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="currentColor" class="w-3 h-3">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                          </svg>
                          <Link :href="route('myActivity', post.tagged_names.split('-')[0])">{{ post.tagged_names.split('-')[1]
                          }}</Link>
                        </p>
                      </h3>
                      <p class="italic text-[10px] text-gray-600 font-bold">
                        {{ post.created_at.split(" ")[0] }}
                      </p>
                    </div>
                    </div>
            <div class="relative basis-[9%]">
              <span class="cursor-pointer" @click="transitionFunction">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-4 h-4"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M6.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM12.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM18.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z"
                  />
                </svg>
              </span>
            </div>
            
            <transition>
              <div
                v-if="transitionVar"
                class="absolute right-0 top-12 bg-white rounded"
              >
                <ul class="cursor-pointer">
                  <li
                    class="py-2 px-1.5 hover:bg-gray-200 text-[13px]"
                    @click="enregistrerImage()"
                  >
                    Enrégistrer cette image
                  </li>
                  <li
                    class="py-2 px-1.5 hover:bg-gray-200 text-[13px]"
                    @click="deleteImage()"
                    v-if="users.id === $page.props.auth.user.id"
                  >
                    Supprimer l'image
                  </li>
                </ul>
              </div>
            </transition>
          </div>
        </div>

        <div class="mt-[10px]">
          <p v-if="post.bgc !== null && post.body.trim().split(/\s+/).length <= 30" class="w-[90%] text-sm mx-auto mb-2"
            :class="post.bgc + ' py-8 px-2 flex items-center justify-center h-[250px] overflow-y-auto text-white'"
            v-html="post.body"></p>
          <p v-else class="text-sm w-[97%] mx-auto mb-2 px-2 max-h-[500px] overflow-y-auto text-justify"
            v-html="post.body"></p>
          <Link :href="route('postUser', [post.id, post.user_id])"><img v-if="post.image !== null" :src="`/storage/post_images_videos/${post.image}`" alt="image_de_profil"
            class="w-full h-[380px]" /></Link>
          <div class="mt-2" v-if="post.video">
            <video controls :src="`/storage/post_images_videos/${post.video}`"
              class="object-cover h-[400px] w-full rounded-lg" alt="video_post"></video>
          </div>
        </div>
        
        <div
            class="w-[90%] mx-auto mt-[1px] cursor-pointer hover:bg-sky-100 px-1 rounded"
            v-if="number > 0"
            @click="openParticipant"
          >
            <span v-if="varBool && number > 1" class="text-gray-600 text-[13px]"
              >Vous et {{ number - 1 }} autre(s) personne(s) ont aimé cette
              photo.</span
            >
            <span
              v-else-if="varBool && number == 1"
              class="text-gray-600 text-[13px]"
              >Vous avez aimé cette photo.</span
            >
            <span v-else-if="number == 1" class="text-gray-600 text-sm">{{ number }} personne a aimé cette
              photo.</span>
            <span v-else class="text-gray-600 text-[13px]"
              >{{ number }} personne(s) ont aimé cette photo.</span
            >
          </div>

          <div class="my-2 flex w-[98%] mx-auto justify-between items-center">
            <span
              class="basis-[48%] flex justify-center border-gray-400 border-[1px] rounded-2xl p-1 cursor-pointer gap-2 items-center"
              @click="clickLike"
            >
              <span v-if="varBool === false" class="flex gap-2 items-center">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="gray"
                  class="w-5 h-5"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z"
                  />
                </svg>
                <span class="text-gray-600">{{ number }}</span>
              </span>
              <span v-else class="flex gap-2 items-center">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="#0080FF"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="#0080FF"
                  class="w-5 h-5"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z"
                  />
                </svg>
                <span class="text-gray-600 text-sm">{{ number }}</span>
              </span>
            </span>
            <span
              class="basis-[48%] flex justify-center p-1 cursor-pointer gap-2 items-center border-gray-400 border-[1px] rounded-2xl"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="gray"
                class="w-5 h-5"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z"
                />
              </svg>
              <span class="text-gray-600" v-if="numberComment > 0">{{
                numberComment
              }}</span>
              <span class="text-gray-600" v-else>0</span>
            </span>
          </div>

        <transition>
          <div
            v-if="varPar"
            class="z-40 bg-white top-16 fixed bottom-0 left-0 right-0 rounded-l-lg rounded-r-lg"
          >
            <div
              class="relative text-center text-gray-600 text-sm font-bold py-3 border-gray-300 border-b-[1px] mb-2"
            >
              <h4>Personne(s) ayant réagi</h4>
              <span
                class="cursor-pointer absolute top-[10px] right-[5px] border-gray-300 border-[1px] bg-gray-300 rounded p-1"
                @click="closeParticipant"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="black"
                  class="w-3 h-3"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M6 18 18 6M6 6l12 12"
                  />
                </svg>
              </span>
            </div>
            <div class="max-h-[800px] overflow-y-auto">
              <div class="mx-auto w-[90%] flex flex-col gap-y-2 mb-2">
                <div
                  v-for="(el, index) in userLike"
                  class="cursor-pointer hover:bg-sky-100 py-1 px-2 hover:rounded flex justify-between items-center border-gray-300 border-b-[1px]"
                >
                  <Link
                    :href="route('myActivity', el.id)"
                    class="flex items-center gap-2"
                  >
                    <img
                      v-if="el.image"
                      :src="`/storage/profilImage/${el.image}`"
                      alt="image_de_profil"
                      class="w-[50px] h-[50px] rounded-full object-cover"
                    />
                    <img
                      v-else
                      :src="`/storage/images/easy.png`"
                      alt="image_de_profil"
                      class="w-[50px] h-[50px] rounded-full object-cover"
                    />
                    <h5 class="font-bold text-gray-700 text-sm">
                      {{ el.name }}
                    </h5>
                  </Link>
                  <div>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      fill="#0080FF"
                      viewBox="0 0 24 24"
                      stroke-width="1.5"
                      stroke="#0080FF"
                      class="w-6 h-6"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z"
                      />
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </transition>

        <div
          class="bg-white fixed bottom-0 left-0 right-0 rounded-l-lg rounded-r-lg py-2"
        >
          <div class="flex justify-center mx-auto w-[90%]">
            <form
              @submit.prevent="formComment"
              class="flex items-center justify-between basis-full"
            >
              <textarea
                cols="30"
                class="py-0 resize-none h-[30px] rounded-full basis-[92%] focus:ring focus:ring-transparent outline-none"
                placeholder="Laisser un commentaire"
                v-model="comment"
              ></textarea>
              <button>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="#0080FF"
                  class="w-6 h-6"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5"
                  />
                </svg>
              </button>
            </form>
          </div>
        </div>
        </div>
      </section>
    </main>
  </AuthenticatedLayout>
</template>
<style>
/* Styles de base */
html {
  scroll-behavior: smooth;
}

.text::-webkit-scrollbar {
  background-color: #fff;
  width: 4px;
}

/* Couleur de la poignée (thumb) */
.text::-webkit-scrollbar-thumb {
  background-color: #0080ff;
  border-radius: 0.2em;
}

/* Couleur de la poignée lorsqu'elle est survolée */
.text::-webkit-scrollbar-thumb:hover {
  background-color: #333;
}
</style>

<script>
export default {
  props: {
    posts: Array,
    user: Array,
    likeUser: Array,
    getLastImgProfil: Array,
    numbers: Number,
    trueVariable: Boolean,
  },

  data() {
    return {
      post: this.posts,
      users: this.user,
      lastImage: this.getLastImgProfil,
      number: this.numbers,
      varBool: this.trueVariable,
      userLike: this.likeUser,
      varPar: false,
      comment: null,
    };
  },

  methods: {

// Fonction pour enregistrer les commentaires liés
// By KolaDev
formComment() {
  if (this.comment !== null) {
    if (this.comment.trim() !== "") {
      axios
        .post(route("storeCommentPost"), {
          comment: this.comment,
          tableau: this.image,
        })
        .then((response) => {
          this.comment = null;
          if (response.data.success) {
            // this.allCommentaires();
          }
        });
    }
  }
},

// By KolaDev
openParticipant() {
  this.varPar = !this.varPar;
},

//
// By KolaDev
closeParticipant() {
  this.varPar = !this.varPar;
},

    // Fonction pour ajouter des likes
    // By KolaDev
    clickLike()
    {
      axios
        .post(route("addLikePost"), {
          image: this.posts,
        })
        .then((response) => {
          if (response.data.success) {
            this.allLikeByPost();
          }
        });
    },

    // Fonction pour récupérer tous les likes
    // By KolaDev
    allLikeByPost()
    {
      axios
        .post(route("allLikeByPost"), {
          image: this.posts,
        })
        .then((response) => {
          this.number = response.data.number;
          this.varBool = response.data.variable;
          this.userLike = response.data.userLike;
        });
    }
  },
};
</script>