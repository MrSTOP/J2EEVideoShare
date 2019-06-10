<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">


      <title>哔哩哔哩 (゜-゜)つロ 干杯~-bilibili</title>
      <link rel="shortcut icon" href="./resources/img/titleIcon.ico" />
      <link rel="stylesheet" type="text/css" href="./css/material-components-web.css" />
      <link rel="stylesheet" type="text/css" href="./css/material-icons.css" />
      <link rel="stylesheet" type="text/css" href="./css/CommonCSS.css" />
      <script src="./js/jquery-3.4.1.js"></script>
  </head>

  <body>
  <header class=" mdc-top-app-bar mdc-top-app-bar--dense">
      <div class="mdc-top-app-bar__row">
          <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
              <a href="index.jsp" class="material-icons mdc-top-app-bar__navigation-icon">home</a>
          </section>
          <section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end">
              <div class="mdc-text-field text-field mdc-text-field--outlined" style="border-radius: 50%">
                  <input type="text" id="text-field-shape-one" class="mdc-text-field__input">
                  <div class="mdc-notched-outline mdc-notched-outline--upgraded">
                      <div class="mdc-notched-outline__leading"></div>
                      <div class="mdc-notched-outline__notch" style="">
                          <label class="mdc-floating-label" for="text-field-shape-one" style="">Standard</label>
                      </div>
                      <div class="mdc-notched-outline__trailing"></div>
                  </div>
              </div>
              <a href="./Collection.jsp" class="material-icons mdc-top-app-bar__action-item" id="Favorite" title="收藏夹">star</a>
              <a href="./PersonalMain.jsp" class="material-icons mdc-top-app-bar__action-item" id="UserSpace" title="个人空间">perm_identity</a>
              <span title="用户名">${sessionScope.user.userName}</span>
              <a href="Logout" class="material-icons mdc-top-app-bar__action-item" title="注销">logout</a>
          </section>
      </div>
  </header>
  <div style="height: 50px"></div>
  <article>
      <div class="mdc-layout-grid">
          <div class="mdc-layout-grid__inner">
              <div class="mdc-layout-grid__cell">
                  <div class="mdc-card demo-card">
                      <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                          <div class="mdc-card__media mdc-card__media--16-9 demo-card__media" style="background-image: url('https://material-components.github.io/material-components-web-catalog/static/media/photos/3x2/2.jpg');"></div>
                          <div class="demo-card__primary">
                              <h2 class="demo-card__title mdc-typography mdc-typography--headline6">Our Changing Planet</h2>
                              <h3 class="demo-card__subtitle mdc-typography mdc-typography--subtitle2">by Kurt Wagner</h3>
                          </div>
                          <div class="demo-card__secondary mdc-typography mdc-typography--body2">Visit ten places on our planet that are undergoing the biggest changes today.</div>
                      </div>
                      <div class="mdc-card__actions">
                          <div class="mdc-card__action-buttons">
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Read</button>
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Bookmark</button>
                          </div>
                          <div class="mdc-card__action-icons">
                              <button class="mdc-icon-button mdc-card__action mdc-card__action--icon--unbounded" aria-pressed="false" aria-label="Add to favorites" title="Add to favorites">
                                  <i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">favorite</i>
                                  <i class="material-icons mdc-icon-button__icon">favorite_border</i>
                              </button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="Share" data-mdc-ripple-is-unbounded="true">share</button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="More options" data-mdc-ripple-is-unbounded="true">more_vert</button>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="mdc-layout-grid__cell">
                  <div class="mdc-card demo-card">
                      <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                          <div class="mdc-card__media mdc-card__media--16-9 demo-card__media" style="background-image: url('https://material-components.github.io/material-components-web-catalog/static/media/photos/3x2/2.jpg');"></div>
                          <div class="demo-card__primary">
                              <h2 class="demo-card__title mdc-typography mdc-typography--headline6">Our Changing Planet</h2>
                              <h3 class="demo-card__subtitle mdc-typography mdc-typography--subtitle2">by Kurt Wagner</h3>
                          </div>
                          <div class="demo-card__secondary mdc-typography mdc-typography--body2">Visit ten places on our planet that are undergoing the biggest changes today.</div>
                      </div>
                      <div class="mdc-card__actions">
                          <div class="mdc-card__action-buttons">
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Read</button>
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Bookmark</button>
                          </div>
                          <div class="mdc-card__action-icons">
                              <button class="mdc-icon-button mdc-card__action mdc-card__action--icon--unbounded" aria-pressed="false" aria-label="Add to favorites" title="Add to favorites">
                                  <i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">favorite</i>
                                  <i class="material-icons mdc-icon-button__icon">favorite_border</i>
                              </button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="Share" data-mdc-ripple-is-unbounded="true">share</button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="More options" data-mdc-ripple-is-unbounded="true">more_vert</button>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="mdc-layout-grid__cell">
                  <div class="mdc-card demo-card">
                      <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                          <div class="mdc-card__media mdc-card__media--16-9 demo-card__media" style="background-image: url('https://material-components.github.io/material-components-web-catalog/static/media/photos/3x2/2.jpg');"></div>
                          <div class="demo-card__primary">
                              <h2 class="demo-card__title mdc-typography mdc-typography--headline6">Our Changing Planet</h2>
                              <h3 class="demo-card__subtitle mdc-typography mdc-typography--subtitle2">by Kurt Wagner</h3>
                          </div>
                          <div class="demo-card__secondary mdc-typography mdc-typography--body2">Visit ten places on our planet that are undergoing the biggest changes today.</div>
                      </div>
                      <div class="mdc-card__actions">
                          <div class="mdc-card__action-buttons">
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Read</button>
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Bookmark</button>
                          </div>
                          <div class="mdc-card__action-icons">
                              <button class="mdc-icon-button mdc-card__action mdc-card__action--icon--unbounded" aria-pressed="false" aria-label="Add to favorites" title="Add to favorites">
                                  <i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">favorite</i>
                                  <i class="material-icons mdc-icon-button__icon">favorite_border</i>
                              </button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="Share" data-mdc-ripple-is-unbounded="true">share</button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="More options" data-mdc-ripple-is-unbounded="true">more_vert</button>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="mdc-layout-grid__cell">
                  <div class="mdc-card demo-card">
                      <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                          <div class="mdc-card__media mdc-card__media--16-9 demo-card__media" style="background-image: url('https://material-components.github.io/material-components-web-catalog/static/media/photos/3x2/2.jpg');"></div>
                          <div class="demo-card__primary">
                              <h2 class="demo-card__title mdc-typography mdc-typography--headline6">Our Changing Planet</h2>
                              <h3 class="demo-card__subtitle mdc-typography mdc-typography--subtitle2">by Kurt Wagner</h3>
                          </div>
                          <div class="demo-card__secondary mdc-typography mdc-typography--body2">Visit ten places on our planet that are undergoing the biggest changes today.</div>
                      </div>
                      <div class="mdc-card__actions">
                          <div class="mdc-card__action-buttons">
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Read</button>
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Bookmark</button>
                          </div>
                          <div class="mdc-card__action-icons">
                              <button class="mdc-icon-button mdc-card__action mdc-card__action--icon--unbounded" aria-pressed="false" aria-label="Add to favorites" title="Add to favorites">
                                  <i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">favorite</i>
                                  <i class="material-icons mdc-icon-button__icon">favorite_border</i>
                              </button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="Share" data-mdc-ripple-is-unbounded="true">share</button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="More options" data-mdc-ripple-is-unbounded="true">more_vert</button>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="mdc-layout-grid__cell">
                  <div class="mdc-card demo-card">
                      <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                          <div class="mdc-card__media mdc-card__media--16-9 demo-card__media" style="background-image: url('https://material-components.github.io/material-components-web-catalog/static/media/photos/3x2/2.jpg');"></div>
                          <div class="demo-card__primary">
                              <h2 class="demo-card__title mdc-typography mdc-typography--headline6">Our Changing Planet</h2>
                              <h3 class="demo-card__subtitle mdc-typography mdc-typography--subtitle2">by Kurt Wagner</h3>
                          </div>
                          <div class="demo-card__secondary mdc-typography mdc-typography--body2">Visit ten places on our planet that are undergoing the biggest changes today.</div>
                      </div>
                      <div class="mdc-card__actions">
                          <div class="mdc-card__action-buttons">
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Read</button>
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Bookmark</button>
                          </div>
                          <div class="mdc-card__action-icons">
                              <button class="mdc-icon-button mdc-card__action mdc-card__action--icon--unbounded" aria-pressed="false" aria-label="Add to favorites" title="Add to favorites">
                                  <i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">favorite</i>
                                  <i class="material-icons mdc-icon-button__icon">favorite_border</i>
                              </button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="Share" data-mdc-ripple-is-unbounded="true">share</button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="More options" data-mdc-ripple-is-unbounded="true">more_vert</button>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="mdc-layout-grid__cell">
                  <div class="mdc-card demo-card">
                      <div class="mdc-card__primary-action demo-card__primary-action" tabindex="0">
                          <div class="mdc-card__media mdc-card__media--16-9 demo-card__media" style="background-image: url('https://material-components.github.io/material-components-web-catalog/static/media/photos/3x2/2.jpg');"></div>
                          <div class="demo-card__primary">
                              <h2 class="demo-card__title mdc-typography mdc-typography--headline6">Our Changing Planet</h2>
                              <h3 class="demo-card__subtitle mdc-typography mdc-typography--subtitle2">by Kurt Wagner</h3>
                          </div>
                          <div class="demo-card__secondary mdc-typography mdc-typography--body2">Visit ten places on our planet that are undergoing the biggest changes today.</div>
                      </div>
                      <div class="mdc-card__actions">
                          <div class="mdc-card__action-buttons">
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Read</button>
                              <button class="mdc-button mdc-card__action mdc-card__action--button">Bookmark</button>
                          </div>
                          <div class="mdc-card__action-icons">
                              <button class="mdc-icon-button mdc-card__action mdc-card__action--icon--unbounded" aria-pressed="false" aria-label="Add to favorites" title="Add to favorites">
                                  <i class="material-icons mdc-icon-button__icon mdc-icon-button__icon--on">favorite</i>
                                  <i class="material-icons mdc-icon-button__icon">favorite_border</i>
                              </button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="Share" data-mdc-ripple-is-unbounded="true">share</button>
                              <button class="mdc-icon-button material-icons mdc-card__action mdc-card__action--icon--unbounded" title="More options" data-mdc-ripple-is-unbounded="true">more_vert</button>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </article>
  </body>
</html>
