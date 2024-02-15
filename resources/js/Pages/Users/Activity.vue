<script setup>
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import ComposantUser from "@/Composables/UserComposant.vue";
import { Head, Link } from "@inertiajs/vue3";
</script>

<template>
  <Head title="Mon journal" />
  <AuthenticatedLayout>
    <main class="mt-[-20px]">
      <ComposantUser :filesProfil="imageProfil" :covers="couverture" :lastImage="thisImage" :niveau="'activity'"
        :followin="userfollow" :followe="followers" :usersIdentifiant="users" :numberLik="numberLike" :allImg="getLastImgProfil" />

      <section class="mt-2 bg-white mb-3" v-if="exist">
        <div class="w-full p-4 flex flex-col gap-2">
          <div class="flex items-center gap-4">
            <div class="aspect-square rounded-full">
              <img v-if="$page.props.auth.user.id === users.id" class="rounded-full aspect-square w-[50px]" :src="imageProfil !== null
                ? `/storage/profilImage/${imageProfil}`
                : `/storage/images/account.png`
                " alt="" />
              <img v-else class="rounded-full aspect-square w-[50px]" :src="lastImgConnect !== null
                ? `/storage/profilImage/${lastImgConnect.file_profile}`
                : `/storage/images/account.png`
                " alt="" />
            </div>
            <h3 v-if="$page.props.auth.user.id === users.id"
              class="text-[12px] font-extrabold text-gray-600 py-2 px-1 rounded-full border basis-[85%] bg-gray-100"
              @click="showModalPublication">
              A quoi vous pensez ?
            </h3>
            <h3 v-else
              class="text-[12px] font-extrabold text-gray-600 py-2 px-1 rounded-full border basis-[85%] bg-gray-100"
              @click="showModalPublication">
              Ecrire sur le journal de <span>{{ users.name }}</span>
            </h3>
          </div>
        </div>

        <div id="divPost" class="hidden z-40 bg-white top-[62px] fixed bottom-0 left-0 right-0 rounded-l-lg rounded-r-lg">
          <div class="relative text-gray-600 text-sm font-bold py-3 border-gray-300 border-b-[1px] mb-2">
            <div class="mx-auto w-[90%] flex items-center justify-between">
              <div class="flex items-center gap-2">
                <span class="cursor-pointer border-gray-300 border-[1px] bg-gray-300 rounded p-1"
                  @click="closeModalPublication">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-3 h-3">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5 8.25 12l7.5-7.5" />
                  </svg>
                </span>
                <h4>Créer un post</h4>
              </div>
              <button class="text-sky-500 font-bold" id="button-3" v-if="$page.props.auth.user.id === users.id"
                @click="publishPost('button-3')">
                Publier
              </button>
              <button v-else class="text-sky-500 font-bold" id="button-4" @click="publishPost('button-4', user.id)">
                Publier
              </button>
            </div>
          </div>
          <div class="mx-auto w-[95%] overflow-y-auto h-[500px]">
            <div class="w-full p-1">
              <template v-if="selectedColorIndex !== null">
                <div class="bg-pink-300 h-64 flex items-center p-5" :class="`${colorArray[selectedColorIndex]}`">
                  <textarea
                    class="min-w-full text-white overflow-hidden focus:ring focus:ring-transparent cursor:text border-none outline-none rounded-md text-center bg-transparent resize-none placeholder:text-white placeholder:font-bold"
                    placeholder="Ecrivez quelque chose..." v-model="publish"></textarea>
                </div>
              </template>
              <template v-else>
                <textarea rows="4"
                  class="rounded min-w-full resize-none focus:ring focus:ring-transparent border-none bg-gray-200 placeholder:text-sm placeholder:font-bold"
                  placeholder="Ecrivez quelque chose..." v-model="publish"></textarea>
              </template>
            </div>

            <div class="flex items-center gap-1 justify-between px-2" v-if="imageInput === false">
              <ul class="flex flex-wrap gap-1">
                <li v-for="(color, index) in colorArray" :key="index" class="aspect-square rounded-full w-[20px]"
                  :class="`${color}`" :id="'li-' + index" @click="openTextarea(index)"></li>
              </ul>
              <ul>
                <li @click="closeTextarea"
                  class="cursor-pointer flex item-center justify-center bg-white border shadow aspect-square rounded-full w-[20px]">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="text-red-500 w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                  </svg>
                </li>
              </ul>
            </div>

            <div class="mt-4">
              <form>
                <label for="photos" class="cursor-pointer">Photos/Vidéos</label>
                <input type="file" class="hidden" id="photos" @change="imageIn()" />
              </form>
            </div>

            <div id="loader" class="hidden flex justify-center"><span class="loader"></span></div>

            <div class="relative" v-if="nameImg">
              <div v-if="nameImg !== null && valeur === 'image'" class="mt-2">
                <img :src="`/storage/post_images_videos/${nameImg}`" class="object-cover h-[400px] w-full rounded-lg"
                  alt="image_post" />
              </div>
              <div v-if="nameImg !== null && valeur === 'video'" class="mt-2">
                <video preload="auto" controls autoplay :src="`/storage/post_images_videos/${nameImg}`"
                  class="object-cover h-[400px] w-full rounded-lg" alt="video_post"></video>
              </div>
              <span
                class="cursor-pointer absolute top-[5px] right-[5px] border-gray-300 border-[1px] bg-gray-300 rounded-full p-1"
                @click="closeVisual">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="black"
                  class="w-3 h-3">
                  <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
                </svg>
              </span>
            </div>

            <p id="paragraph" class="my-2 hidden bg-red-200 text-red-600 font-bold p-1 rounded"></p>

            <button v-if="$page.props.auth.user.id === users.id"
              class="mt-4 w-full bg-[#0c7fb9] text-white text-center p-2 rounded-lg" id="button-1" type="button"
              @click="publishPost('button-1')">
              PUBLIER
            </button>
            <button v-else class="mt-4 w-full bg-[#0c7fb9] text-white text-center p-2 rounded-lg" id="button-2"
              type="button" @click="publishPost('button-2', user.id)">
              PUBLIER
            </button>
          </div>
        </div>
      </section>

      <div class="bg-white" v-if="allTab.length > 0">
        <section class="mt-2 bg-white py-1">
          <div class="flex flex-col">
            <div v-for="(el, index) in allTab" :key="index" class="border-b-[1px] pb-2 shadow-sm my-1">
              <div v-if="el.creator_name">
                <div class="flex items-center justify-between">
                  <div class="flex items-center gap-2 px-2">
                    <img :src="el.image_user !== null
                      ? `/storage/profilImage/${el.image_user}`
                      : `/storage/images/account.png`
                      " alt="image_de_profil" class="rounded-full w-[60px] h-[55px]" />
                    <div>
                      <h3 class="text-[12px] flex flex-wrap items-center gap-x-2 font-bold text-gray-700"
                        v-if="el.tagged_names !== null && $page.props.auth.user.id == el.tagged_names.split('-')[0]">
                        <Link :href="route('myActivity', el.user_id)">{{ el.creator_name }}</Link> <svg
                          xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                          stroke="currentColor" class="w-3 h-3">
                          <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                        </svg>
                        <Link :href="route('myActivity', el.tagged_names.split('-')[0])">{{ el.tagged_names.split('-')[1] }}
                        </Link>
                      </h3>
                      <h3 class="text-[12px] flex flex-wrap items-center gap-x-2 font-bold text-gray-700" v-else>
                        <Link :href="route('myActivity', el.user_id)">{{ el.creator_name }}</Link>
                        <p class="text-[12px] flex flex-wrap items-center gap-x-1" v-if="el.tagged_names !== null"><svg
                            xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="currentColor" class="w-3 h-3">
                            <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
                          </svg>
                          <Link :href="route('myActivity', el.tagged_names.split('-')[0])">{{ el.tagged_names.split('-')[1]
                          }}</Link>
                        </p>
                      </h3>
                      <p class="italic text-[10px] text-gray-600 font-bold">
                        {{ el.created_at.split(" ")[0] }}
                      </p>
                    </div>
                  </div>
                  <div class="relative basis-[2%] mr-2">
                    <span class="cursor-pointer" @click="transitionFunction(index)">
                      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-4 h-4">
                        <path stroke-linecap="round" stroke-linejoin="round"
                          d="M6.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM12.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM18.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                      </svg>
                    </span>
                    <transition>
                      <div :id="'posts-' + index" v-if="el.video !== null || el.image !== null"
                        class="allPosts hidden w-[160px] absolute right-0 top-4 border-gray-400 border-[1px] bg-white rounded">
                        <ul class="cursor-pointer">
                          <li class="py-2 px-1.5 hover:bg-gray-200 text-[13px]" @click="saveImage(el, index)">
                            Enrégistrer cette image
                          </li>
                          <li class="py-2 px-1.5 hover:bg-gray-200 text-[13px]" @click="deletePost(el, index)"
                            v-if="el.user_id === $page.props.auth.user.id">
                            Supprimer le post
                          </li>
                        </ul>
                      </div>
                      <div :id="'posts-' + index" v-else-if="el.user_id === $page.props.auth.user.id"
                        class="allPosts hidden w-[160px] absolute right-0 top-4 border-gray-400 border-[1px] bg-white rounded">
                        <ul class="cursor-pointer">
                          <li class="py-2 px-1.5 hover:bg-gray-200 text-[13px]" @click="deletePost(el, index)">
                            Supprimer le post
                          </li>
                        </ul>
                      </div>
                    </transition>
                  </div>
                </div>
                <div class="mt-[10px]">
                  <p v-if="el.bgc !== null && el.body.trim().split(/\s+/).length <= 30" class="w-[90%] text-sm mx-auto mb-2"
                    :class="el.bgc + ' py-8 px-2 flex items-center justify-center h-[250px] overflow-y-auto text-white'"
                    v-html="el.body"></p>
                  <p v-else class="text-sm w-[97%] mx-auto mb-2 px-2 max-h-[500px] overflow-y-auto text-justify"
                    v-html="el.body"></p>
                  <Link :href="route('postUser', [el.id, el.user_id])"><img v-if="el.image !== null" :src="`/storage/post_images_videos/${el.image}`" alt="image_de_profil"
                    class="w-full h-[380px]" /></Link>
                  <div class="mt-2" v-if="el.video">
                    <video controls :src="`/storage/post_images_videos/${el.video}`"
                      class="object-cover h-[400px] w-full rounded-lg" alt="video_post"></video>
                  </div>
                </div>
                <div class="mt-2 flex justify-between items-center w-[95%] mx-auto">
                  <span
                    class="basis-[48%] flex justify-center border-gray-400 border-[1px] rounded-2xl p-1.5 cursor-pointer gap-2 items-center">
                    <span class="flex gap-2 items-center">
                      <svg xmlns="http://www.w3.org/2000/svg" fill="#FFFFFF" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="gray" class="w-5 h-5">
                        <path stroke-linecap="round" stroke-linejoin="round"
                          d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z" />
                      </svg>
                      <span class="text-gray-600 text-sm">{{ 0 }}</span>
                    </span>
                  </span>
                  <Link :href="route('postUser', [el.id, el.user_id])"
                    class="basis-[48%] flex justify-center p-1 cursor-pointer gap-2 items-center border-gray-400 border-[1px] rounded-2xl">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="gray"
                    class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round"
                      d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z" />
                  </svg>
                  <span class="text-gray-600">{{ 0 }}</span>
                  </Link>
                </div>
              </div>

              <div v-else-if="el.file_profile">
                <div class="flex items-center justify-between">
                <div class="flex items-center gap-2 px-2">
                  <img :src="`/storage/profilImage/${getLastImgProfil.file_profile}`" alt="image_de_profil"
                    class="rounded-full w-[50px] h-[50px]" />
                  <div>
                    <h3 class="font-bold text-[14px] text-gray-700 text-[12px]">{{ el.name }}</h3>
                    <p class="italic text-[10px] text-gray-600 font-bold">
                      {{ el.created_at.split("T")[0] }}
                    </p>
                  </div>
                </div>
                <div class="relative basis-[2%] mr-2">
                  <span class="cursor-pointer" @click="transitionFunctionOne(index)">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                      stroke="currentColor" class="w-4 h-4">
                      <path stroke-linecap="round" stroke-linejoin="round"
                        d="M6.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM12.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0ZM18.75 12a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0Z" />
                    </svg>
                  </span>
                  <transition>
                    <div :id="'index-' + index"
                      class="allClick hidden w-[160px] absolute right-0 top-4 border-gray-400 border-[1px] bg-white rounded">
                      <ul class="cursor-pointer">
                        <li class="py-2 px-1.5 hover:bg-gray-200 text-[13px]" @click="enregistrerImage(el, index)">
                          Enrégistrer cette image
                        </li>
                        <li class="py-2 px-1.5 hover:bg-gray-200 text-[13px]" @click="deleteImage(el, index)"
                          v-if="users.id === $page.props.auth.user.id">
                          Supprimer l'image
                        </li>
                      </ul>
                    </div>
                  </transition>
                </div>

              </div>
              <div class="mt-[10px]" @click="viewPostProfil(getLastImgProfil.user_id, el.id)">
                <img :src="`/storage/profilImage/${el.file_profile}`" alt="image_de_profil" class="w-full h-[380px]" />
              </div>
              <div class="w-[90%] mx-auto mt-[2px] cursor-pointer hover:bg-sky-100 px-1 rounded" v-if="el.likes > 0">
                <span :id="'like-' + index" v-if="el.trueVariable && el.likes > 1" class="text-gray-600 text-sm">Vous et {{ el.likes - 1 }}
                  autre(s) personne(s) ont aimé cette
                  photo.</span>
                <span :id="'like-' + index" v-else-if="el.trueVariable && el.likes == 1" class="text-gray-600 text-sm">Vous avez aimé cette
                  photo.</span>
                <span :id="'like-' + index" v-else-if="el.likes == 1" class="text-gray-600 text-sm">{{ el.likes }} personne a aimé cette
                  photo.</span>
                <span :id="'like-' + index" v-else class="text-gray-600 text-sm">{{ el.likes }} personne(s) ont aimé cette photo.</span>
              </div>
              <div class="mt-2 flex justify-between items-center w-[95%] mx-auto">
                <span
                  class="basis-[48%] flex justify-center border-gray-400 border-[1px] rounded-2xl p-1.5 cursor-pointer gap-2 items-center"
                  @click="clickLike(el, `${'like-' + index}`)">
                  <span v-if="el.trueVariable === false" class="flex gap-2 items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                      stroke="gray" class="w-5 h-5">
                      <path stroke-linecap="round" stroke-linejoin="round"
                        d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z" />
                    </svg>
                    <span class="text-gray-600">{{ el.likes }}</span>
                  </span>
                  <span v-else class="flex gap-2 items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="#0080FF" viewBox="0 0 24 24" stroke-width="1.5"
                      stroke="#0080FF" class="w-5 h-5">
                      <path stroke-linecap="round" stroke-linejoin="round"
                        d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z" />
                    </svg>
                    <span class="text-gray-600 text-sm">{{ el.likes }}</span>
                  </span>
                </span>
                <span
                  class="basis-[48%] flex justify-center p-1 cursor-pointer gap-2 items-center border-gray-400 border-[1px] rounded-2xl"
                  @click="viewPostProfil(getLastImgProfil.user_id, el.id)">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="gray"
                    class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round"
                      d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z" />
                  </svg>
                  <span class="text-gray-600">{{ el.comments }}</span>
                </span>
              </div>

              </div>
            </div>
          </div>
        </section>

      </div>
    </main>
  </AuthenticatedLayout>
</template>

<style>
.loader {
  width: 30px;
  height: 30px;
  border: 5px dotted rgb(129, 33, 33);
  border-radius: 50%;
  display: inline-block;
  position: relative;
  box-sizing: border-box;
  animation: rotation 2s linear infinite;
}

@keyframes rotation {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}
</style>

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
    lastImgConnect: Array,
    allFilesProfils: Array,
    user: Array,
    posts: Array,
    mergesTab: Array,
    exist: Boolean,
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
      allTab: this.mergesTab,

      publish: "",
      imageInput: false,
      nameImg: null,
      valeur: null,

      textTextareColor: [
        // Tableau contenant les couleur de text dans le textarea
        "text-black",
        "text-white",
        "text-gray-400",
        "text-gray-800",
        "text-red-400",
        "text-red-900",
        "text-lime-50",
      ],
      colorArray: [
        "bg-gradient-to-r from-cyan-500 to-blue-500",
        "bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500",
        "bg-gradient-to-r from-gray-700 to-lime-700",
        "bg-gradient-to-t from-gray-700 to-lime-700",
        "bg-gradient-to-t from-gray-700 to-rose-400",
        "bg-gradient-to-t from-gray-700 to-rose-700",
        "bg-gradient-to-br from-gray-700 to-pink-400",
        "bg-gradient-to-br from-gray-700 to-slate-400",
        "bg-gradient-to-br from-gray-700 to-sky-800",
        "bg-gradient-to-br from-gray-700 to-sky-400",
        "bg-gradient-to-br from-gray-700 to-fuchsia-400",
        "bg-gradient-to-br from-gray-700 to-rose-200",
      ], // TAbleau de couleur
      selectedColorIndex: null, // Indice de l'élément li affichant le tableau de couleur sélectionner
      postsUser: this.posts,
    };
  },

  watch: {
    publish(newValue, oldValue) { 
      if(newValue.trim().split(/\s+/).length >= 30)
      {
        this.imageInput = true;
      } else {
        this.imageInput = false;
      }
    }
  },

  methods: {
    // Fonction pour supprimer une publication
    // By KolaDev
    deletePost(el, index) {
      document.getElementById(`posts-${index}`).classList.add("hidden");
      axios
        .delete(
          route("deletePost", {
            image: el,
          })
        )
        .then((response) => {
          if (response.data.success) {
            window.location.href = window.location.href;
          }
        });
    },
    // Fonction pour supprimer une image de profil
    // By KolaDev
    deleteImage(el, index) {
      document.getElementById(`index-${index}`).classList.add("hidden");
      axios
        .delete(
          route("deleteImageUser", {
            image: el,
          })
        )
        .then((response) => {
          if (response.data.success) {
            window.location.href = window.location.href;
          }
        });
    },

    // Fonction pour télécharger une image ou une vidéo d'un post
    // By KolaDev
    saveImage(el, index) {
      axios
        .get(
          route("enregistrerImage", {
            image: el,
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
          // Ajout de l'attribut download avec pour nom de téléchargement nom
          let nom = el.image !== null ? el.image : el.video;
          link.setAttribute("download", nom);
          // Ajout du lien dans le body de la page
          document.body.appendChild(link);
          // Clique automatique du lien
          link.click();
          // Suppression du lien créé
          document.body.removeChild(link);
          document.getElementById(`posts-${index}`).classList.add("hidden");
        });
    },

    enregistrerImage(el, index) {
      axios
        .get(
          route("enregistrerImage", {
            image: el,
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
          // Ajout de l'attribut download avec pour nom de téléchargement el.file_profile
          link.setAttribute("download", el.file_profile);
          // Ajout du lien dans le body de la page
          document.body.appendChild(link);
          // Clique automatique du lien
          link.click();
          // Suppression du lien créé
          document.body.removeChild(link);
          document.getElementById(`index-${index}`).classList.add("hidden");
        });
    },

    transitionFunction(index) {
      document.querySelectorAll(".allClick").forEach(el => {
        el.classList.add("hidden");
      })
      document.querySelectorAll(".allPosts").forEach(el => {
        if (el.id === `posts-${index}`) {
          if (document.getElementById(`posts-${index}`).className.includes("hidden")) {
            document.getElementById(`posts-${index}`).classList.remove("hidden");
          } else {
            document.getElementById(`posts-${index}`).classList.add("hidden");
          }
        } else {
          el.classList.add("hidden")
        }
      })
    },

    transitionFunctionOne(index) {
      document.querySelectorAll(".allClick").forEach(el => {
        if (el.id === `index-${index}`) {
          if (document.getElementById(`index-${index}`).className.includes("hidden")) {
            document.getElementById(`index-${index}`).classList.remove("hidden");
          } else {
            document.getElementById(`index-${index}`).classList.add("hidden");
          }
        } else {
          el.classList.add("hidden")
        }
      })
    },

    imageIn() {
      this.imageInput = true;
      let myDataFile = photos.files[0];
      let formData = new FormData();
      loader.classList.remove("hidden");
      formData.append("myCover", myDataFile);
      axios
        .post(route("post.storeImgDeo"), formData, {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        })
        .then((response) => {
          loader.classList.add("hidden");
          if (!response.data.error) {
            this.nameImg = response.data.nameImg;
            this.valeur = response.data.valeur;
            paragraph.classList.add("hidden");
            paragraph.innerHTML = "";
          } else {
            photos.value = "";
            paragraph.classList.remove("hidden");
            paragraph.innerHTML = response.data.error;
          }
        });
    },

    closeVisual() {
      axios
        .delete(
          route("post.deleteImgDeo", {
            nameImg: this.nameImg,
          })
        )
        .then((response) => {
          this.imageInput = !this.imageInput;
          this.nameImg = null;
          photos.value = "";
        });
    },

    // By KolaDev
    publishPost(element, identifiant = null) {
      if (photos.value === "") {
        if (this.publish.trim() !== "") {
          document.getElementById(`${element}`).setAttribute("disabled", "");
          axios
            .post(route("createPost"), {
              tag: identifiant,
              publish: this.publish,
              bgc: this.colorArray[this.selectedColorIndex],
            })
            .then((response) => {
              if (response.data.message) {
                paragraph.classList.add("hidden");
                paragraph.innerHTML = "";
                window.location.href = window.location.href;
              } else {
                document.getElementById(`${element}`).removeAttribute("disabled");
                paragraph.classList.remove("hidden");
                paragraph.innerHTML = "Une erreur est survenue !!!";
              }
            });
        }
      } else {
        if (this.nameImg !== null) {
          document.getElementById(`${element}`).setAttribute("disabled", "");
          axios
            .post(route("createPostTwo"), {
              tag: identifiant,
              publish: this.publish,
              fichier: this.nameImg,
              value: this.valeur,
            })
            .then((response) => {
              if (response.data.message) {
                paragraph.classList.add("hidden");
                paragraph.innerHTML = "";
                window.location.href = window.location.href;
              } else {
                document.getElementById(`${element}`).removeAttribute("disabled");
                paragraph.classList.remove("hidden");
                paragraph.innerHTML = "Une erreur est survenue !!!";
              }
            });
        }
      }
    },

    // By KolaDev
    // Fonction pour cacher le modal de création de post
    closeModalPublication() {
      divPost.classList.add("hidden");
    },

    // By KolaDev
    // Fonction pour afficher le modal de création de post
    showModalPublication() {
      divPost.classList.remove("hidden");
    },

    // By KolaDev
    viewPostProfil(user_id, id) {
      window.location.href = `/postProfil/${user_id}/${id}`;
    },

    /**
     * Permet d'ouvrir un
     * textarea sur commande pour créer
     * un post en attribuant une valer à la
     * variable selectedColorIndex
     *
     * @param {*} _index
     */
    openTextarea(_index) {
      this.selectedColorIndex = _index; // Met à jour l'indice de l'élément li sélectionné
    },

    /**
     * Permet de cacher le textarea
     * afficher sur demande
     * en attribuant à nouveau la valeur
     * null à notre variable selectedColorIndex
     */
    closeTextarea() {
      this.selectedColorIndex = null;
    },

    // By KolaDev
    clickLike(el, element) {
      axios
        .post(route("addLikeFile"), {
          image: el,
        })
        .then((response) => {
          if (response.data.success) {
            this.alFil(el, element);
          }
        });
    },

    // By KolaDev
    alFil(el, element) {
      axios
        .post(route("allFilPro"), {
          table: el,
        })
        .then((response) => {
          if(response.data.success)
          {
            document.getElementById(`${element}`).innerHTML = response.data.success;
            if(response.data.variableTrue)
            {
              document.getElementById(`${element}`).parentElement.nextElementSibling.children[0].children[0].innerHTML = `
                  <span class="flex gap-2 items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="#0080FF" viewBox="0 0 24 24" stroke-width="1.5"
                      stroke="#0080FF" class="w-5 h-5">
                      <path stroke-linecap="round" stroke-linejoin="round"
                        d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z" />
                    </svg>
                    <span class="text-gray-600 text-sm">${response.data.countLike}</span>
                  </span>`
                } else {
              document.getElementById(`${element}`).parentElement.nextElementSibling.children[0].children[0].innerHTML = `
                  <span class="flex gap-2 items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                      stroke="gray" class="w-5 h-5">
                      <path stroke-linecap="round" stroke-linejoin="round"
                        d="M6.633 10.25c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 0 1 2.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 0 0 .322-1.672V2.75a.75.75 0 0 1 .75-.75 2.25 2.25 0 0 1 2.25 2.25c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282m0 0h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 0 1-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 0 0-1.423-.23H5.904m10.598-9.75H14.25M5.904 18.5c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 0 1-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 9.953 4.167 9.5 5 9.5h1.053c.472 0 .745.556.5.96a8.958 8.958 0 0 0-1.302 4.665c0 1.194.232 2.333.654 3.375Z" />
                    </svg>
                    <span class="text-gray-600 text-sm">${response.data.countLike}</span>
                  </span>`
              
            }
          }
        });
    },
  },
};
</script>