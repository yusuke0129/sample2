<template>
  <v-layout column justify-center align-center>
    <v-flex xs12 sm8 md6>
      <v-card class="mx-auto" max-width="100%">
        <v-card-title class="headline">
          <span class="samrt-font">About this application</span>
        </v-card-title>

        <v-container fluid>
          <v-row dense>
            <v-col
              v-for="card in cards_row1"
              :key="card.title"
              :cols="card.flex"
              :md="card.md"
            >
              <div class="buttons">
                <v-card class="card-border pulse">
                  <v-card-title>
                    <h2>{{ card.title }}</h2>
                  </v-card-title>
                  <a :href="card.link">
                    <v-img
                      :src="card.src"
                      class="black--text align-end card-img"
                      height="200px"
                    />
                  </a>
                  <v-card-actions>
                    <v-spacer />

                    <v-card-text>
                      <p>{{ card.text }}</p>
                    </v-card-text>
                  </v-card-actions>
                </v-card>
              </div>
            </v-col>
          </v-row>
          <v-row dense>
            <v-col
              v-for="card in cards_row2"
              :key="card.title"
              :cols="card.flex"
              :md="card.md"
            >
              <v-card class="card-border">
                <v-card-title>
                  <h2>{{ card.title }}</h2>
                </v-card-title>
                <a :href="card.link">
                  <v-img
                    :src="card.src"
                    class="black--text align-end card-img"
                    height="200px"
                  >
                  </v-img>
                </a>
                <v-card-actions>
                  <v-spacer />

                  <v-card-text>
                    <p>{{ card.text }}</p>
                  </v-card-text>
                </v-card-actions>
              </v-card>
            </v-col>
          </v-row>
          <v-row dense>
            <v-col
              v-for="card in cards_row3"
              :key="card.title"
              :cols="card.flex"
              :md="card.md"
            >
              <v-card class="card-border">
                <v-card-title>
                  <h2>{{ card.title }}</h2>
                </v-card-title>
                <a :href="card.link">
                  <v-img
                    :src="card.src"
                    class="black--text align-end card-img"
                    height="200px"
                  />
                </a>
                <v-card-actions>
                  <v-spacer />

                  <v-card-text>
                    <p>{{ card.text }}</p>
                  </v-card-text>
                </v-card-actions>
              </v-card>
            </v-col>
          </v-row>
        </v-container>
      </v-card>
    </v-flex>
  </v-layout>
</template>
<script>
export default {
  name: "App",
  data: () => ({
    cards_row1: [
      {
        title: "Nuxt.js",
        src: "/Nuxt.png",
        md: 4,
        flex: 12,
        text:
          "フロントエンドのフレームワークにNuxt.jsを使用し、高速なWEBサイトの表示、SSRによるSEO対応を可能にしています。",
        link: "https://nuxtjs.org",
      },
      {
        title: "Vuetify",
        src: "/Vuetify.jpg",
        md: 4,
        flex: 12,
        text:
          "デザインフレームワークにVuetify.jsを使用し、デザインセンスに自信がなくとも簡易にリッチでスタイリッシュな画面が作れます。",
        link: "https://vuetifyjs.com",
      },
      {
        title: "Ruby on Rails",
        src: "/rails.png",
        md: 4,
        flex: 12,
        text: "バックエンドのフレームワークにはRuby on Railsを採用。複雑なロジックもシンプルなコードで実装でき、高い開発効率を実現できます。",
        link: "https://guides.rubyonrails.org",
      },
    ],
    cards_row2: [
      {
        title: "Rspec",
        src: "/Rspec.jpg",
        md: 4,
        flex: 12,
        text:
          "バックエンドのテストフレームワークにRspecを採用しています。TDDを生産的にし、Railsアプリケーションの保守性を高めます。",
        link: "https://rspec.info",
      },
      {
        title: "Amazon Web Service",
        src: "/aws.png",
        md: 4,
        flex: 12,
        text: "このアプリはAWSにデプロイしています。ハードウェアの導入が不要で、負荷に応じて柔軟にリソースを拡張できます。",
        link: "https://aws.amazon.com",
      },
      {
        title: "Docker",
        src: "/docker.png",
        flex: 12,
        md: 4,
        text: "開発で使ったImageをそのまま本番環境で稼働させる事ができ、また、トラフィック量への柔軟な対応も可能にします。",
        link: "https://docs.docker.com",
      },
    ],
    cards_row3: [
      {
        title: "Nginx",
        src: "/Nginx.png",
        md: 4,
        flex: 12,
        text:
          "リバースプロキシにNginxを導入し、セキュリティー対策や、負荷分散の調整を容易にしています。",
        link: "https://nginx.org/en/",
      },
      {
        title: "Sidekiq",
        src: "/sidekiq.png",
        md: 4,
        flex: 12,
        text: "ジョブ管理にsidekiqを採用しています。大量の処理であっても非同期にスムーズな実行が可能です。",
        link: "https://sidekiq.org",
      },
      {
        title: "GitHub",
        src: "/GitHub.jpg",
        md: 4,
        flex: 12,
        text: "ソースコードはGitHubで管理しています。このアプリのソースコードはGithubよりご確認頂けます。",
        link: "https://github.com/yinomata-jp/app",
      },
    ],
  }),
}
</script>
<style scoped>
.card-img {
  height: 100%;
  width: 300px;
  object-fit: cover;
  margin-left: auto;
  margin-right: auto;
}

.card-border {
  padding-top: 15px;
  border: 2px rgb(0, 0, 0) solid;
}

.card-border:hover {
  box-shadow: inset 0 0 0 rgba(255, 255, 255, 0.3),
    0 0 1.2em rgba(255, 255, 255, 0.5);
  animation: pulse 1s;
  box-shadow: 0 0 0 2em rgba(#fff, 0);
  text-shadow: 1.3px 1.3px #ef6eae !important;
}

@keyframes pulse {
  0% {
    box-shadow: 0 0 0 0 var(--hover);
  }
}

h2 {
  transition: text-shadow 1s !important;
  font: 300 1em "Fira Sans", sans-serif !important;
  margin: 0 auto !important;
}
</style>
