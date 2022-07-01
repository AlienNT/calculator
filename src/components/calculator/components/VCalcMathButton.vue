<template>
  <div class="v-math-button">
    <button
        :disabled="disabled"
        @click="() => $emit('onClick', button)">
      {{ button }}
    </button>
  </div>
</template>

<script>
export default {
  name: "VCalcMathButton",
  props: {
    button: {
      type: [String, Number],
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
$mathButtonBGColor: orange;
$mathButtonTextColor: white;
.v-math-button {
  flex: 1 1 50%;
  display: flex;
  align-items: center;
  justify-content: center;

  button {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 85%;
    height: 85%;
    margin: auto;
    font-size: 24px;
    border-radius: 150px;
    background: $mathButtonBGColor;
    color: $mathButtonTextColor;
    border: none;
    cursor: pointer;

    &:hover {
      background: darken($mathButtonBGColor, 5%);
    }
  }
}

</style>
