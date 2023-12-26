<template>
    <svg v-if="name === 'plus'" width="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="plus">
        <g data-name="Layer 2">
            <g data-name="plus">
                <rect width="24" height="24" opacity="0" transform="rotate(180 12 12)"></rect>
                <path d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2z"></path>
            </g>
        </g>
    </svg>


    <svg v-else-if="name === 'sun'" width="15" fill="white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" id="sun">
        <path
            d="M16 7c-4.962 0-9 4.037-9 9s4.038 9 9 9c4.963 0 9-4.037 9-9s-4.037-9-9-9zm0 15c-3.309 0-6-2.691-6-6s2.691-6 6-6 6 2.691 6 6-2.691 6-6 6zm0-16.361a1.5 1.5 0 0 0 1.5-1.5V2a1.5 1.5 0 0 0-3 0v2.139a1.5 1.5 0 0 0 1.5 1.5zM6.552 8.673a1.498 1.498 0 0 0 2.122 0 1.5 1.5 0 0 0 0-2.121L7.16 5.04A1.5 1.5 0 1 0 5.04 7.161l1.512 1.512zM5.638 16a1.5 1.5 0 0 0-1.5-1.5H2a1.5 1.5 0 0 0 0 3h2.138a1.5 1.5 0 0 0 1.5-1.5zm.914 7.327L5.04 24.84a1.5 1.5 0 1 0 2.121 2.121l1.512-1.512a1.5 1.5 0 1 0-2.12-2.12zM16 26.361a1.5 1.5 0 0 0-1.5 1.5V30a1.5 1.5 0 0 0 3 0v-2.139a1.5 1.5 0 0 0-1.5-1.5zm9.448-3.034a1.5 1.5 0 1 0-2.12 2.121l1.51 1.512a1.496 1.496 0 0 0 2.121 0 1.5 1.5 0 0 0 .001-2.121l-1.512-1.512zM30 14.5h-2.139a1.5 1.5 0 0 0 0 3H30a1.5 1.5 0 0 0 0-3zm-5.612-5.388c.383 0 .767-.146 1.06-.44l1.512-1.51a1.5 1.5 0 1 0-2.121-2.122l-1.512 1.512a1.5 1.5 0 0 0 1.06 2.56z">
        </path>
    </svg>


</template>


<script setup>
const props = defineProps({
    name: String,
})


function closeWindows() {
    const getBtnClose = document.getElementById('btn_close');
    ;
    getBtnClose.addEventListener('click', function (event) {
        window.open('', '_self').close();
    })

}

function endCall() {

}
</script>

<style></style>
