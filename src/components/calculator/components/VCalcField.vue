<template>
<div class="v-calc-field">
  <div class="history">
    <div v-for="item in history" :key="item?.result">
      <div class="string">{{item?.string}}</div>
      <div class="result">{{item?.result}}</div>
    </div>
  </div>
  <div class="math-string">
    <div>{{mathString || 0}}</div>
  </div>
</div>
</template>

<script>
export default {
  name: "VCalcField",
  props: {
    mathString: {
      type: [String, Number],
      default: '',
    },
    result: {
      type: [String, Number],
      default: '0',
    },
    history: {
      type: Object,
      default: null,
    }
  }
}
</script>

<style scoped lang="scss">
$fieldTextColor: #2c2c2c;
.v-calc-field {
  width: 100%;
  flex: 1 1 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding: 10px 15px;
  .math-string {
    text-align: right;
    font-size: 48px;
    font-weight: bold;
    color: $fieldTextColor;
    word-break: break-all;
  }
  .history {
    text-align: right;
    font-size: 12px;
    color: lighten($fieldTextColor, 30%);
    .result {
      font-weight: bold;
      color: lighten($fieldTextColor, 20%);
    }
  }
}

</style>
