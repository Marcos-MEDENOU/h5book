<template>
    <svg v-if="name === 'plus'" width="16" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="plus">
        <g data-name="Layer 2">
            <g data-name="plus">
                <rect width="24" height="24" opacity="0" transform="rotate(180 12 12)"></rect>
                <path d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2z"></path>
            </g>
        </g>
    </svg>

    <svg  v-else-if="name === 'jjjj'" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" id="plus">
        <g data-name="Layer 2">
            <g data-name="plus">
                <rect width="24" height="24" opacity="0" transform="rotate(180 12 12)"></rect>
                <path d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2z"></path>
            </g>
        </g>
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
