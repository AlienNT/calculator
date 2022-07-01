<template>
  <VCalculator/>
</template>

<script>
import VCalculator from "@/components/calculator/VCalculator";

export default {
  name: "VMain",
  components: {
    VCalculator
  }
}
</script>

<style>
* {
  box-sizing: border-box;
  margin: 0;
}
[disabled] {
  opacity: 0.5;
}
</style>
