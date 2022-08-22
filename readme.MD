# Breadcrumb Generator

We would like you to implement a breadcrumb menu generator. Specifically, to create a function that takes a URL and a separator (see below) and returns a string representing each element of the HTML required to render a breadcrumb linking to each page.

![menu](https://github.com/krazerxz/breadcrumb-generator/blob/main/menu.png)
Example Breadcrumb menu

## Examples
###### 1
```
breadcrumb_function("https://www.btplc.com/SITES/ADASTRAL.HTML", " : ")
```
Should return:
```
<a href="/">HOME</a> : <a href="/SITES/">SITES</a> : <span class="active">ADASTRAL</span>
```

###### 2
```
breadcrumb_function("https://www.btplc.com/careercentre/Technology.htm", " / ")
```
Should return:
```
<a href="/">HOME</a> / <a href="/careercentre/">CAREERCENTRE</a> / <span class="active">TECHNOLOGY</span>
```

###### 3
```
breadcrumb_function("https://www.btplc.com/careercentre/vacancies/Technology.htm", " : ")
```
Should return:
```
<a href="/">HOME</a> / <a href="/careercentre/">CAREERCENTRE</a> / <a href="/careercentre/vacancies/">VACANCIES</a> / <span class="active">TECHNOLOGY</span>
```

###### 4
```
breadcrumb_function("https://www.btplc.com/careercentre/index.htm", " : ")
```
Should return:
```
<a href="/">HOME</a> : <span class="active">CAREERCENTRE</span>
```

## Requirements:
 * Element text should be in uppercase.
 * Your function should work for any number of sub-pages. The URL should build as shown in example 3.
 * Each element should be separated by a user entered separator.
 * Ignore anchors and parameters.
 * The last element can terminate in an extension (.html, .htm, .php, etc. ).
 * You will always be provided a valid url – You don’t need to validate them.

## Tips:
  * Use the language you’re most comfortable working in
  * Evidence of testing is good
  * If, for some reason you aren’t able to complete it, concentrate on the quality of the parts you complete, rather than producing a bad implementation of the whole thing.
  * There’s no need to implement a CLI, web interface or anything more complicated than a simple procedure/method/function.
    * But you’re welcome to write a wrapper if you like (eg if it helps with testing).
  * We're not expecting this to take you more than an hour or so.
  * Feel free to use existing libraries if appropriate.
  * When you attend the interview, please join on a laptop where you can run/edit your code as you will be asked to make a modification during the interview.
