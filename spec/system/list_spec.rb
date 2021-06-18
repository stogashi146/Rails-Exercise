# frozen_string_literal: true

require 'rails_helper'

describe "投稿のテスト" do
  # let!：let!による事前評価
  let!(:list){create(:list,title:"hoge",body:"body")}
  # describe：トップ画面(top_path)のテスト
  describe "トップ画面(top_path)のテスト" do
    # before：トップ画面への遷移
    before do
      visit top_path
    end
    # context：表示の確認
    context "表示の確認" do
      # it：トップ画面(top_path)に「ここはTopページです」が表示されているか
      it "トップ画面(top_path)に「ここはTopページです」が表示されているか" do
        # テストコード
        expect(page).to have_content"ここはTopページです"
      end
      # it：top_pathが"/top"であるか
      it 'top_pathが"/top"であるか' do
        # テストコード
        expect(top_path).to eq("/top")
      end
    end
  end
  # describe ：投稿画面のテスト
  describe "投稿画面のテスト" do
    # before ：投稿画面への遷移
    before do
      visit todolists_new
    end
    # context：表示の確認
    context "表示の確認" do
      # it ：todolists_new_pathが"/todolists/new"であるか'
      it 'todolists_new_pathが"/todolists/new"であるか' do
        # テストコード
        expect(new_path).to eq("/todolists/new")
      end
      # it：投稿ボタンが表示されているか'
      it "投稿ボタンが表示されているか" do
        # テストコード
        expect(page).to have_button"投稿"
      end
    end
    # context：投稿処理のテスト
    context "投稿ボタンのテスト" do
      # it：投稿後のリダイレクト先は正しいか
      it "投稿ボタンのリダイレクト先は正しいか" do
        # テストコード
        fill_in "list[title]",with:Faker::Lorem.characters(number:10)
        fill_in "list[body]",with:Faker::Lorem.characters(number:30)
        click_button "投稿"
      end
    end
  end

  # describe：一覧画面のテスト
  describe  "一覧画面のテスト" do
    # before：一覧画面への遷移
    before do
      visit todolists_path
    end
    # context ：一覧の表示とリンクの確認
    context "一覧の表示とリンクの確認" do
      # it：一覧表示画面に投稿されたもの表示されているか
      it "一覧表示画面に投稿されたもの表示されているか" do
        # テストコード
        expect(page).to have_content list.title
        expect(page).to have_link list.title
      end
    end
  end

  # describe：詳細画面のテスト
  describe "詳細画面のテスト" do
    # before：詳細画面への遷移
    before do
      visit todolist_path(list)
    end
    # context：表示のテスト
    context "表示のテキスト" do
      # it：削除リンクが存在しているか
      it "削除リンクが存在しているか" do
        # テストコード
        expect(page).to have_link "削除"
      end
      it "編集リンクが存在しているか" do
        expect(page).to have_link "編集"
      end
    context "リンクの遷移先の確認" do
      it "編集の遷移先は編集画面か" do
        # テストコード
        edit_link = find_all("a")[3]
        edit_link.click_button
        expect(current_path).to eq("/todolists/"+list.id.to_s + "/edit")
    context：list削除のテスト
      it：listの削除
        テストコード

  describe：編集画面のテスト
    before：編集画面への遷移
    context：表示の確認
      it：編集前のタイトルと本文がフォームに表示(セット)されている
        テストコード
      it：保存ボタンが表示される
    context：更新処理に関するテスト
      it：更新後のリダイレクト先は正しいか
        テストコード