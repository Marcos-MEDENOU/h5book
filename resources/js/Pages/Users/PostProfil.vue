<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import ComposantUser from "@/Composables/UserComposant.vue";
import { Head, Link } from "@inertiajs/vue3";
</script>

<template>
  <Head title="Friends" />
  <AuthenticatedLayout>
    <main class="mt-[-20px]">
      <section>
        <div class="bg-white relative border-gray-400 border-b-[1px]">
          <div class="flex justify-between items-center">
            <div class="mt-[5px] flex flex-wrap items-center gap-2 px-2">
              <div class="flex items-center gap-2">
                <Link :href="route('myActivity', lastImage.user_id)">
                  <img
                    :src="`/storage/profilImage/${lastImage.file_profile}`"
                    alt="image_de_profil"
                    class="rounded-full w-[50px] h-[50px]"
                  />
                </Link>
                <div class="flex">
                  <p class="text-[13px] font-bold">
                    <Link
                      :href="route('myActivity', lastImage.user_id)"
                      class="font-bold text-gray-700 text-[13px]"
                      >{{ users.name }}</Link
                    >
                    a changé sa photo de profil
                  </p>
                </div>
              </div>
              <p
                class="italic mx-auto w-[68%] mt-[-10px] text-[10px] text-gray-600 font-bold"
              >
                {{ image.created_at.split("T")[0] }}
              </p>
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
          <div class="mt-[10px]">
            <img
              :src="`/storage/profilImage/${image.file_profile}`"
              alt="image_de_profil"
              class="w-full h-[380px]"
            />
          </div>
          <div
            class="w-[90%] mx-auto mt-[1px] cursor-pointer hover:bg-sky-100 px-1 rounded"
            v-if="number > 0"
            @click="openParticipant"
          >
            <span v-if="varBool && number > 1" class="text-gray-600 text-sm"
              >Vous et {{ number - 1 }} autre(s) personne(s) ont aimé cette
              photo.</span
            >
            <span
              v-else-if="varBool && number == 1"
              class="text-gray-600 text-sm"
              >Vous avez aimé cette photo.</span
            >
            <span v-else-if="number == 1" class="text-gray-600 text-sm">{{ number }} personne a aimé cette
              photo.</span>
            <span v-else class="text-gray-600 text-sm"
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
        </div>

        <div class="mb-6 bg-white mb-[40px]">
          <div class="mx-auto w-[90%] p-2" v-if="allComment.length !== 0">
            <h4 class="font-bold text-gray-700">Tous les commentaires</h4>

            <div
              v-for="(commentaire, index) in allComment"
              class="relative my-4 rounded border-gray-300 basis-[90%]"
            >
              <div class="flex gap-2">
                <img
                  v-if="commentaire.image"
                  :src="`/storage/profilImage/${commentaire.image}`"
                  alt="image_de_profil"
                  class="w-[45px] h-[45px] rounded-full object-cover"
                />
                <img
                  v-else
                  :src="`/storage/images/easy.png`"
                  alt="image_de_profil"
                  class="w-[45px] h-[45px] rounded-full object-cover"
                />
                <div
                  class="flex flex-col basis-[90%] rounded border-gray-300 shadow-xl border-[1px] p-2.5"
                >
                  <Link
                    :href="route('myActivity', commentaire.id)"
                    class="font-bold text-gray-700 text-sm"
                    >{{ commentaire.name }}</Link
                  >

                  <p
                    :id="`comment-${commentaire.idComment}`"
                    class="comment text-sm text-gray-600 max-h-[180px] overflow-y-auto text mt-[8px]"
                    v-html="commentaire.comment"
                  ></p>

                  <transition>
                    <form class="mt-2" v-if="commentaire.idComment === idEdit">
                      <textarea
                        v-model="editComment"
                        class="px-1 py-0 w-full rounded border-gray-300 focus:ring-0"
                        cols="30"
                        rows="3"
                      ></textarea>
                    </form>
                  </transition>
                </div>
              </div>
              <div class="flex justify-between mt-2">
                <span class="text-[12px] text-gray-600 font-bold italic">
                  Fait le {{ commentaire.created_at.split("T")[0] }}
                </span>
                <div
                  :id="`allButtons-${commentaire.idComment}`"
                  class="flex justify-end gap-2 items-center allButtons"
                >
                  <button
                    v-if="
                      $page.props.auth.user.id === commentaire.id &&
                      commentaire.idComment === idEdit
                    "
                    class="text-sm font-bold text-blue-500"
                    @click="sendUpdate(commentaire.idComment)"
                  >
                    Modifier
                  </button>

                  <button
                    v-if="
                      $page.props.auth.user.id === commentaire.id &&
                      commentaire.idComment === idEdit
                    "
                    class="text-sm font-bold text-gray-500"
                    @click="cancelEdit(commentaire.idComment)"
                  >
                    Annuler
                  </button>

                  <button
                    :id="`button-${commentaire.idComment}`"
                    class="button text-sm font-bold text-sky-600"
                    @click="
                      answerComment(commentaire.idComment, commentaire.name)
                    "
                  >
                    Répondre
                  </button>

                  <button
                    v-if="$page.props.auth.user.id === commentaire.id"
                    class="text-sm font-bold text-red-500"
                    @click="deleteComment(commentaire.idComment)"
                  >
                    Supprimer
                  </button>
                </div>
              </div>
              <transition>
                <div v-if="commentaire.idComment === answerId" class="mt-2">
                  <form @submit.prevent="sendAnswer(commentaire.idComment)">
                    <textarea
                      v-model="answerCom"
                      class="px-1 py-0 w-full rounded border-gray-300 focus:ring-0"
                      cols="30"
                      rows="3"
                      placeholder="Répondez à ce commentaire"
                    ></textarea>
                    <div class="flex justify-end gap-2">
                      <button class="text-sm font-bold text-gray-700">
                        Envoyer
                      </button>
                      <span
                        @click="cancelAnswer(commentaire.idComment)"
                        class="cursor-pointer font-bold text-sm text-red-600"
                      >
                        Annuler
                      </span>
                    </div>
                  </form>
                </div>
              </transition>

              <span
                v-if="$page.props.auth.user.id === commentaire.id"
                class="absolute top-[4px] right-[4px] bg-gray-300 p-1.5 rounded-full animate-pulse cursor-pointer"
                @click="edit(commentaire.idComment)"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-3 h-3"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125"
                  />
                </svg>
              </span>
            </div>
          </div>
          <div v-else class="mx-auto w-[90%] p-2 flex flex-col gap-2">
            <div class="flex justify-center">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="gray"
                class="w-14 h-14"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z"
                />
              </svg>
            </div>
            <div class="flex flex-col items-center">
              <p class="font-bold text-gray-600">
                Aucun commentaire pour l'instant
              </p>
              <p class="text-[13px]">Soyez le premier à commenter</p>
            </div>
          </div>
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
    file: Array,
    infoUser: Array,
    last: Array,
    trueVariable: Boolean,
    countLike: Number,
    countComment: Number,
    userlike: Array,
    allComments: Array,
  },

  data() {
    return {
      image: this.file,
      users: this.infoUser,
      lastImage: this.last,
      number: this.countLike,
      numberComment: this.countComment,
      varBool: this.trueVariable,
      userLike: this.userlike,
      varPar: false,
      variableComment: true,
      transitionVar: false,
      comment: null,
      idEdit: null,
      editComment: null,
      answerId: null,
      answerCom: null,
      allComment: this.allComments,
    };
  },

  methods: {
    // Fonction pour ajouter des likes
    // By KolaDev
    clickLike() {
      axios
        .post(route("addLikeFile"), {
          image: this.image,
        })
        .then((response) => {
          if (response.data.success) {
            this.allLikeByImage();
          }
        });
    },

    // Fonction pour récupérer tous les likes
    // By KolaDev
    allLikeByImage() {
      axios
        .post(route("allLikeFile"), {
          image: this.image,
        })
        .then((response) => {
          this.number = response.data.number;
          this.varBool = response.data.variable;
          this.userLike = response.data.userLike;
        });
    },

    //
    // By KolaDev
    openParticipant() {
      this.varPar = !this.varPar;
    },

    //
    // By KolaDev
    closeParticipant() {
      this.varPar = !this.varPar;
    },

    //
    // By KolaDev
    transitionFunction() {
      this.transitionVar = !this.transitionVar;
    },

    // Fonction pour exporter l'image
    // By KolaDev
    enregistrerImage() {
      this.transitionVar = !this.transitionVar;
      axios
        .get(
          route("enregistrerImage", {
            image: this.image,
          }),
          {
            responseType: "blob",
          }
        )
        .then((response) => {
          let url = window.URL.createObjectURL(
            new Blob([response.data], { type: "application/octet-stream" })
          );
          // Création d'un lien de téléchargement
          let link = document.createElement("a");
          link.href = url;
          // Ajout de l'attribut download avec pour nom de téléchargement this.image.file_profile
          link.setAttribute("download", this.image.file_profile);
          // Ajout du lien dans le body de la page
          document.body.appendChild(link);
          // Clique automatique du lien
          link.click();
          // Suppression du lien créé
          document.body.removeChild(link);
        });
    },

    // Fonction pour supprimer l'image
    // By KolaDev
    deleteImage() {
      this.transitionVar = !this.transitionVar;
      axios
        .delete(
          route("deleteImageUser", {
            image: this.image,
          })
        )
        .then((response) => {
          if (response.data.success) {
            window.history.back();
          }
        });
    },

    // Fonction pour enregistrer les commentaires liés
    // By KolaDev
    formComment() {
      if (this.comment !== null) {
        if (this.comment.trim() !== "") {
          axios
            .post(route("storeComment"), {
              comment: this.comment,
              tableau: this.image,
            })
            .then((response) => {
              this.comment = null;
              if (response.data.success) {
                this.allCommentaires();
              }
            });
        }
      }
    },

    // Fonction pour récupérer tous les commentaires basés sur cette image
    // By KolaDev
    allCommentaires() {
      axios
        .post(route("allCommentaires"), {
          tableau: this.image,
        })
        .then((response) => {
          this.allComment = response.data.allComments;
          this.numberComment = this.allComment.length;
        });
    },

    // Fonction pour supprimer le commentaire
    // By KolaDev
    deleteComment(id) {
      axios
        .delete(
          route("deleteCommentFile", {
            id: id,
          })
        )
        .then((response) => {
          if (response.data.success) {
            this.allCommentaires();
          }
        });
    },

    // Fonction pour afficher le commentaire dans un champ
    // By KolaDev
    edit(id) {
      axios
        .post(route("editCommentFile"), {
          id: id,
        })
        .then((response) => {
          let com = document.querySelectorAll(".comment");
          com.forEach((el) => {
            el.classList.remove("hidden");
          });
          let but = document.querySelectorAll(".button");
          but.forEach((el) => {
            el.classList.remove("hidden");
          });
          document.querySelector(`#comment-${id}`).classList.add("hidden");
          document.querySelector(`#button-${id}`).classList.add("hidden");
          this.idEdit = id;
          this.editComment = response.data.comment.comment;
        });
    },

    // Fonction pour le formulaire pour répondre au commentaire
    // By KolaDev
    answerComment(id, name) {
      let but = document.querySelectorAll(".allButtons");
      but.forEach((el) => {
        el.classList.remove("hidden");
      });
      document.querySelector(`#allButtons-${id}`).classList.add("hidden");
      this.answerId = id;
      this.answerCom = `@${name} `;
    },

    // Fonction pour modifier le commentaire
    // By KolaDev
    sendUpdate(id) {
      if (this.editComment !== null) {
        if (this.editComment.trim() !== "") {
          axios
            .post(route("sendUpdate"), {
              id: id,
              comment: this.editComment,
            })
            .then((response) => {
              if (response.data.success) {
                this.cancelEdit(id);
                this.allCommentaires();
              }
            });
        }
      }
    },

    // Fonction pour annuler la modification d'un commentaire
    // By KolaDev
    cancelEdit(id) {
      document.querySelector(`#comment-${id}`).classList.remove("hidden");
      document.querySelector(`#button-${id}`).classList.remove("hidden");
      this.idEdit = null;
      this.editComment = null;
    },

    // Fonction pour cacher le formulaire de réponse au commentaire
    // By KolaDev
    cancelAnswer(id) {
      document.querySelector(`#allButtons-${id}`).classList.remove("hidden");
      this.answerId = null;
      this.answerCom = null;
    },

    // Fonction pour ajouter la réponse au commentaire
    // By KolaDev
    sendAnswer(id) {
      if (this.answerCom !== null) {
        if (this.answerCom.trim() !== "") {
          axios
            .post(route("storeComment"), {
              comment: this.answerCom,
              tableau: this.image,
            })
            .then((response) => {
              if (response.data.success) {
                this.cancelAnswer(id);
                this.allCommentaires();
              }
            });
        }
      }
    },
  },
};
</script>