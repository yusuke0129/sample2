<template>
  <v-layout column justify-center align-center>
    <v-flex class="text-center" xs12 sm8 md6>
      <img src="/v.png" alt="Vuetify.js" class="mb-5" >
        <v-card width="800px" class="mx-auto mt-5">
          <v-card-title>
            <h1 class="display-1">
              <span class="samrt-font">User Registration</span>
            </h1>
          </v-card-title>
          <v-card-text>
            <v-form>
              <v-text-field
                prepend-icon="mdi-account-circle"
                label="name"
                :value="name"
                @input="onInputName"
              />
              <v-text-field
                prepend-icon="mdi-account-circle"
                label="E-mail"
                :value="email"
                @input="onInputEmail"
              />
              <v-text-field
                :type="showPassword ? 'text' : 'password'"
                prepend-icon="mdi-lock"
                :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
                label="Password"
                :value="password"
                @click:append="showPassword = !showPassword"
                @input="onInputPassword"
              />
              <v-card-actions>
                <v-btn
                  class="fuller-button"
                  style="margin: 0 auto"
                  :loading="loading"
                  @click="regist"
                >
                  regist
                </v-btn>
              </v-card-actions>
            </v-form>
          </v-card-text>
        </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
export default {
  name: "App",
  data: () => ({
    showPassword: false,
    loading: false,
    email: "",
    name: "",
    password: "",
  }),
  methods: {
    onInputName(name) {
      this.name = name
    },
    onInputEmail(email) {
      this.email = email
    },
    onInputPassword(password) {
      this.password = password
    },
    async regist() {
      let query =
        "?" +
        "name=" +
        this.name +
        "&email=" +
        this.email +
        "&password=" +
        this.password +
        "&confirm_success_url=http://54.238.36.167/"
      this.loading = true
      try {
        await this.$axios.$post(`http://54.238.36.167:3000/api/auth${query}`)
      } catch (e) {
        alert("入力内容が不正です。\n登録に失敗しました")
        return
      } finally {
        this.loading = false
      }
      alert("メールを送信しました\nアカウントを有効化した後ログイン下さい")
      this.name = ""
      this.email = ""
      this.password = ""
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
