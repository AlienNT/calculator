<template>
  <div class="v-num-button">
    <button
        type="button"
        :disabled="disabled"
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
.v-num-button {
  box-sizing: border-box;
  position: relative;
  align-items: center;
  justify-content: center;
  display: flex;
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
  right: 0;
  bottom: 0;
  margin: auto;
  display: flex;
  width: 85%;
  height: 85%;
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
