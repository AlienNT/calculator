<template>
  <VMain/>
</template>

<script>
import VMain from "@/components/VMain";

export default {
  name: 'App',
  components: {
    VMain,
  },
  mounted() {
    console.log('Vue Project Run')
  }
}
</script>
<style lang="scss">
@import "assets/css/main";
</style>
