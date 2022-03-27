# Unsplasher_UIKit
- UIKit으로 Unsplash 앱 만들기

## 프로젝트 설명
- UIKit을 사용하며, Code Base로 UI를 구현합니다.
- MVC 패턴을 적용하였습니다.

## 진행 상황
- [ ] Home 화면 UI 구현
  - [x] Editorial 이미지를 보여줄 UI 구현
  - [x] tableView 설정
  - [ ] 네비게이션바 아래의 메뉴 UI 구현
  - [ ] custom color 적용
- [x] Search 화면 UI 구현
  - [x] collectionView 설정
  - [x] custom color 적용

(*추가 작성 예정...)

## Issue
<details> 
  <summary> 3/24 </summary>
  
> 이슈
- searchView : searchBar, descoverLabel 이 안보이고, colletionView만 보임

> 해결
  ```swift
  searchBar.translatesAutoresizingMaskIntoConstraints = false
  discoverLabel.translatesAutoresizingMaskIntoConstraints = false
  ```
- `translatesAutoresizingMaskIntoConstraints` 설정을 안해줬었음
    
</details>
