<template>
  <v-layout column justify-center align-center>
    <v-flex class="text-center" xs12 sm8 md6>
      <v-card width="1200px" class="mx-auto mt-5">
        <v-card-title>
          <h1 class="px-5 py-3">
            <span class="samrt-font">Sample</span>
          </h1>
        </v-card-title>
        <v-card-text>
          <p class="text-left">
            サンプル管理画面です。この画面では問い合わせ履歴を確認できます<br>検索日付を指定すると指定日付の問い合わせ履歴のみ表示されます<br >
            <em><small>
              ※バックエンドのサンプルのspecはこの処理に関するテストコードとして作成しています</small></em>
          </p>
        </v-card-text>
        <v-simple-table dark>
          <thead>
            <tr>
              <th width="80px" class="text-center">検索日付</th>
              <th width="600px">
                <v-menu
                  ref="menu"
                  v-model="menu"
                  :close-on-content-click="false"
                  :return-value.sync="date"
                  transition="scale-transition"
                  offset-y
                  max-width="290px"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-text-field
                      v-model="date"
                      label="Picker"
                      　prepend-icon="mdi-application"
                      readonly
                      v-bind="attrs"
                      v-on="on"
                    />
                  </template>
                  　　
                  <v-date-picker
                    v-model="date"
                    :show-current="false"
                    @contextmenu:year="contextMenu"
                    @dblclick:date="dblClick"
                    @mouseenter:month="mouseEnter"
                    @mouseleave:month="mouseLeave"
                  >
                    <v-spacer />
                    <v-btn text color="primary" @click="menu = false">
                      Cancel
                    </v-btn>
                    <v-btn text color="primary" @click="$refs.menu.save(date)">
                      OK
                    </v-btn>
                  </v-date-picker>
                </v-menu>
                <v-spacer />
              </th>
              <th width="100px" />
              <th justify="right">
                <v-btn class="fuller-button" :loading="loading" @click="search">
                  Search
                </v-btn>
                <v-btn class="fuller-button" @click="clear"> Clear </v-btn>
              </th>
            </tr>
          </thead>
        </v-simple-table>
      </v-card>

      <v-simple-table dark>
        <template v-slot:default>
          <thead>
            <tr>
              <th class="text-center">no</th>
              <th class="text-center">name</th>
              <th class="text-center">email</th>
              <th class="text-center">context</th>
              <th class="text-center">created_at</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="contact in contacts" :key="contact.id">
              <td class="text-center">
                {{ contact.id }}
              </td>
              <td class="text-center">
                {{ contact.name }}
              </td>
              <td class="text-center">
                {{ contact.email }}
              </td>
              <td class="text-center">
                {{ contact.context }}
              </td>
              <td class="text-center">
                {{ contact.created_at }}
              </td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
    </v-flex>
  </v-layout>
</template>

<script>
import { mapGetters, mapMutations, mapActions } from "vuex"

export default {
  layout: "signup",
  data() {
    return {
      loading: false,
      contacts: [],
      date: "",
      menu: "",
      done: [false, false, false],
      mouseMonth: null,
    }
  },
  computed: {
    dateRangeText() {
      return this.dates.join(" ~ ")
    },
  },

  methods: {
    async search($axios) {
      let query = "?" + "date=" + this.date
      this.loading = true
      let res = await this.$axios.$get(`http://54.238.36.167:3000/contacts${query}`)
      this.contacts = res.data
      this.loading = false
    },
    clear() {
      this.contacts = []
      this.date = ""
    },
    contextMenu(year, event) {
      this.$set(this.done, 2, true)

      event.preventDefault()

      alert(`You have activated context menu for year ${year}`)
    },
    dblClick(date) {
      this.$set(this.done, 0, true)

      alert(`You have just double clicked the following date: ${date}`)
    },
    mouseEnter(month) {
      this.$set(this.done, 1, true)
      this.mouseMonth = month
    },
    mouseLeave() {
      this.mouseMonth = null
    },
  },
}
</script>
<style scoped>
.fuller-button {
  color: rgba(255, 255, 255, 1);
  background: none;
  border-radius: 0;
  padding: 1.2em 5em;
  letter-spacing: 0.35em;
  font-size: 0.7em;
  transition: background-color 0.3s, box-shadow 0.3s, color 0.3s;
  margin: 1em;
  box-shadow: inset 0 0 1em rgba(0, 170, 170, 0.5),
    0 0 1em rgba(0, 170, 170, 0.5);
  border: #0dd solid 2px;
  box-shadow: inset 0 0 1em rgba(0, 170, 170, 0.5),
    0 0 1em rgba(0, 170, 170, 0.5);
  border: #0dd solid 2px;
}

.fuller-button:hover {
  background-color: #0dd;
  box-shadow: inset 0 0 0 rgba(0, 170, 170, 0.5),
    0 0 1.5em rgba(0, 170, 170, 0.7);
}
</style>
