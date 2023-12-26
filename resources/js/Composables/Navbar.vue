
    <template>
        <header class="headerBg py-2.5 sticky top-0">
            <div class="mx-auto w-[90%] flex justify-between items-center">
                <div class="basis-[70%] flex items-center gap-4">
                    <div class="relative basis-[20%]">
                        <span class="absolute w-[25px] bg-white opacity-30 color rounded-lg px-3">H5</span>
                        <h1 class="color text-[18px] font-bold">
                            H5book
                        </h1>
                    </div>
                    <form class="basis-[70%] flex items-center gap-4 py-1 pl-2 pr-1 border border-sky-500 rounded-lg">
                        <div class="">
                            <svg class="w-4 h-4 text-gray-800 dark:text-white" aria-hidden="true"
                                xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                <path stroke="white" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                            </svg>
                        </div>
                        <input type="text"
                            class="w-full headerBg py-1 rounded-lg placeholder:text-white placeholder:text-sm outline-none border-none focus:border-none focus:border-sky-600 color"
                            placeholder="Recherchez un proche..." >
                    </form>
                </div>
                <div class="basis-[20%]">
                    <ul class="flex gap-4 justify-end items-center">
                        <li v-if="bool">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                                stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="cursor-pointer feather feather-sun icon-light stroke-width-3 iw-16 ih-16">
                                <circle cx="12" cy="12" r="5"></circle>
                                <line x1="12" y1="1" x2="12" y2="3"></line>
                                <line x1="12" y1="21" x2="12" y2="23"></line>
                                <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line>
                                <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line>
                                <line x1="1" y1="12" x2="3" y2="12"></line>
                                <line x1="21" y1="12" x2="23" y2="12"></line>
                                <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line>
                                <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line>
                            </svg>
                        </li>
                        <li v-else>
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                                stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="cursor-pointer feather feather-moon icon-light stroke-width-3 iw-16 ih-16">
                                <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
                            </svg>
                        </li>
                        <li>
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none"
                                stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                class="cursor-pointer feather feather-grid icon-light stroke-width-3 iw-16 ih-16">
                                <rect x="3" y="3" width="7" height="7"></rect>
                                <rect x="14" y="3" width="7" height="7"></rect>
                                <rect x="14" y="14" width="7" height="7"></rect>
                                <rect x="3" y="14" width="7" height="7"></rect>
                            </svg>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
    </template>

<script>
export default
{
    data()
    {
        return {
            bool: false
        }
    }
}

</script>

<style scope>
.color {
    color: #f8f9fa;
}
.headerBg {
    background-color: #0389c9;
}
</style>
