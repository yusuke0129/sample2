<template>
  <v-layout>
    <v-flex class="text-center">
        <p class="text-right">
          ようこそ  <span class="samrt-font">{{ this.name }}</span> さん
        </p>
      <v-card width="1200px" class="mx-auto mt-5">
        <v-card-title class="samrt-font">
          <h1 class="px-5 py-3">
            Profile
          </h1>
        </v-card-title>
        <v-card-text class="samrt-font">
          <h4　class="text-left">
            about me</h4>
            <p class="text-left">
              業務系システムの開発を行っている。主にバックエンドを担当しRubyが一番好き
            </p>
          </h4　class="text-left">
        </v-card-text>
      </v-card>
      <v-spacer />
      <v-simple-table dark>
        <template>
          <thead>
            <tr>
              <th class="text-left" width="300px">
                index
              </th>
              <th class="text-left">
                details
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="item in items" :key="item.name">
              <td class="text-left">
                {{ item.name }}
              </td>
              <td class="text-left">
                {{ item.detail }}
              </td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </v-flex>
  </v-layout>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  layout:'signup',
  async fetch({ $axios, params ,store}) {
    if(store.state.name){ return }
    if(params.id === 'undefined'){
      alert('セッションタイムアウト\n再ログインが必要です。')
      location.href = 'http://54.238.36.167'
      return
    }
    let res = await $axios.$get(`http://back:3000/users/${params.id}`)
    store.commit('setName', {name: res.data.name})
  },
   data () {
    return {
      items: [
        {
          name: '最終学歴',
          detail: '東北大学大学院法学研科総合法制',
        },
        {
          name: '名前',
          detail: '猪股 由輔',
        },
        {
          name: '得意分野',
          detail: "Ruby,   Ruby on Rails,  SQL",
        },
        {
          name: '技術以外の強み',
          detail: "円滑なコミュニケーション、勤怠が良好である事",
        },
        {
          name: '資格',
          detail: 'Java SE 8 Gold,LPIC level 1',
        }
      ],
    }
  },
      computed: {
  ...mapGetters(['name']),
  },
}
</script>
<style scoped>

.samrt-font {
 font-family: 'smartfont';
}

</style>