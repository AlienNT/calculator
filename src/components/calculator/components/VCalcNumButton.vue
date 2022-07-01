<template>
  <div class="v-num-button">
    <button
        type="button"
        @click="()=> $emit('onClick', number)"
    >
      {{ number }}
    </button>
  </div>
</template>

<script>
export default {
  name: "VCalcNumButton",
  props: {
    number: {
      type: [Number, String],
      required: true,
    },
    disabled: {
      type: Boolean,
      default: false,
    }
  },
}
</script>

<style scoped lang="scss">
$numBtnBgColor: #5e5e5e;
$numBtnTextColor: #cbcbcb;
.v-num-button {
  box-sizing: border-box;
  position: relative;
  display: block;
  width: 0;
  height: 0;
  padding-top: 33.33%;
  padding-left: 33.33%;
}

.v-num-button:last-child {
  padding-left: 33.33%;
}

.v-num-button:nth-child(10) {
  padding-left: 66.66%;
}

.v-num-button button {
  position: absolute;
  top: 0;
  left: 0;
  display: flex;
  width: 95%;
  height: 95%;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  cursor: pointer;
  border-radius: 150px;
  border: none;
  background: $numBtnBgColor;
  color: $numBtnTextColor;

  &:hover {
    background: darken($numBtnBgColor, 5%);
  }
}
</style>
