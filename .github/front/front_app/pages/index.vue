<template>
  <v-layout column justify-center align-center>
    <v-flex xs12 sm8 md6>
      <div class="text-center">
        <logo />
        <vuetify-logo />
      </div>
      <v-card width="1200px">
        <notification v-if="accountActivation" class="mb-3" color="success">
          アカウントが有効化しました
        </notification>
        <v-card-title class="samrt-font">
          Welcome to the Inomata's Portfolio
        </v-card-title>
        <v-card-text>
          <p>Inomata's Portfolioへご訪問頂きありがとうございます</p>

          <p>
            このアプリでは認証にdevise_token_authを利用しています。Email:example@example.com
            Password:passwordでサンプルユーザとしてログインできます<br >
            <em><small>&mdash;
              ※ログインすると認証がcookieに保存されます。認証なしに認証が必要なページにアクセスすると当画面へリダイレクトされます</small></em>
          </p>
          <p>
            なお、メール認証によるユーザ登録機能を備えていますので、新たにユーザを作成しログインすることも可能です
          </p>
          <p>
            アプリのバックジョブ管理にはSidekiqを導入しており、<a
              href="http://54.238.36.167:3000/sidekiq/"
              target="_blank"
            >
              ダッシュボード </a>よりJobの実行を確認できます
          </p>
          <p>
            SidekiqのダッシュボードにはBasic認証が設定されており、ID:admin
            Password:adminで認証ができます
          </p>

          <p>
            なお、ソースコードは
            <a
              href="https://github.com/yinomata-jp/app"
              target="_blank"
            >
              Github </a>にて公開しております
          </p>
          <p>
            その他、このアプリケーションについてはこちらよりご確認頂けます
            <router-link to="/about">
Continue
</router-link>
          </p>
          <hr class="my-3" >
          <div class="text-xs-right">
            <em><small>&mdash; y_inomata</small></em>
          </div>
        </v-card-text>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
import Logo from "~/components/Logo.vue"
import VuetifyLogo from "~/components/VuetifyLogo.vue"

export default {
  components: {
    Logo,
    VuetifyLogo,
  },
  async asyncData({ query }) {
    let account_confirmation_success = query.account_confirmation_success
    return { accountActivation: account_confirmation_success }
  },
}
</script>
