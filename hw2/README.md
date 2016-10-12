<<<<<<< HEAD
# Rails DeCal Fall 2016 Homework 1
This assignment involves writing scripts in Ruby to help you become familiar with the Ruby programming language.

## Q1
There is a method called `squared_sum` in hw1.rb. `squared_sum` accepts two integer parameters a and b. The method should calculate the sum of a and b and then return the square of the sum. Please finish this method.

## Q2
There is a method called `sort_array_plus_one` in hw1.rb. `sort_array_plus_one` accepts an array of integers as its parameter. The method should sort the given array, increment each element by 1, and finally return it. Please finish this method, either in a destructive or non-destructive fashion.

## Q3
There is a method called `combine_name` in hw1.rb. `combine_name` accepts two string parameters first_name and last_name. The method should return the first_name concatenated with the last_name with a space in between. Please finish this method.

Example:
```ruby
combine_name 'Charles', 'Xue'
 => 'Charles Xue'
```

## Q4
It's blockin' time!

In hw1.rb we defined a function called `blockin_time` that requires the foobar.rb file, and then calls a class method 'baz' from the Foobar class.

If you take a look at foobar.rb, you'll see that we've defined Foobar. Write a class function in foobar.rb called `baz` that accepts an array of integers as strings, changes each string into an integer, adds two to each number, keeps the even numbers only, removes any duplicates, rejects the resulting numbers greater than ten, and finally returns the sum of the resultingarray.

For example:

`['1', '2', '3', '4', '5', '10']` returns 10. ((2+2) + (4+2)) = 10.

`['1', '2', '2', '2', '3', '4', '5', '10']` returns 10 as well.

## Challenges
- Q1-Q3 can be written in 1 line and under 40 characters. Do this if you want an extra challenge.

- Check out the autograder.rb file and try to figure out how it works!

## Hints
- For Q2 check out these [docs about arrays](http://ruby-doc.org/core-2.2.0/Array.html). In web development in general, there are a lot of docs available when learning new libraries.

- For Q3 you might want to check out
[Ruby's string interpolation] (https://en.wikipedia.org/wiki/String_interpolation#Ruby).

- To open the ruby interpreter to help debug call the 'irb' command in your terminal with the hw1.rb file.
```
irb hw1.rb
```

## How to check your answers
In the base directory of this repo, run `ruby autograder.rb`.
```
ruby autograder.rb
```

If `'All functions work'` appears, everything is correct!
=======
# Rails DeCal Fall 2016 Homework 2

## Introduction
Hey there! Welcome to homework 2 of the Rails DeCal. By this week, the course will have covered routes, simple ruby syntax, and basic CRUD statements.

As you complete this homework, refresh your browser to observe changes you expect. If that doesn't work, try restarting the server.

Per usual, Google and Stack Overflow are your best friends when debugging.

## Setup:
To start everything off, fork this repository - there should be a fork button on the top right corner of the repo.

<b>After you fork</b>, run these commands to clone your newly forked repository:
```
git clone https://github.com/your_username/fa16-hw2
cd fa16-hw2
```

Next, install all the gems (Rails libraries) necessary by running:

```
bundle install
```

Then, start your server by running:
```
rails server
```
Try going to `localhost:3000` in your browser. But wait...it's broken. What's going on? Routes? Undefined?


## BUT WAIT (Preface)!

If you take a look at a couple of the classes in the `app/controllers/concerns/` directory, you'll see some weird functions - `attr_accessor` and `initialize`.

`initialize` is similar to Python's `__init__` method and is called every time you create a new object. If you do not define an `initialize` method, Ruby will just assume that your class has an empty initializor.

`attr_accessor` is used to define instance variables so that you can have both read access (via `your_class.instance_variable`) and edit access (via `your_class.instance_variable = some_value`). Ruby allows you to forbid edit or read access using `attr_readable` and `attr_writer`, respectively.

Also, you'll see a lot of `<%= some_variable %>`. This is embedded ruby, which we'll be covering next week.

## Alright, lets get crackin':

### Question 1
Here, we're going to look into a POST request.

If you look closely at the code at home.html.erb, you'll see a bunch of confusing code like this:

```
<%= form_tag stringify_path do... %>
```
Don't worry if this is confusing to you. We'll be covering forms in the future. What **is** important is that a form POSTs a request to a endpoint/path.

To fix the errors, route a path in the routes.rb file so that a POST request to `localhost:3000` (also known as the `root`) routes to the `stringify` method in `pages_controller.rb`.

Now that we've gone through that hassle, we now face our second problem. If you try to submit the form, you get a views error message (missing template pages/stringify)!

To fix this, update `app/controllers/concerns/stringify` such that the `what_am_i` method returns "You are nothing!" if `@name` or `@adjective` are blank, but returns "<em>your_name</em> is so <em>your_adjective</em>" if `@name` and `@adjective` are not blank.

Hint: The method `blank?` may be helpful.

Following, create a `stringify.html.erb` view and add

```
<%= @text %>
```

to the view (where should this file go?). Now when you submit the form, nothing should error and you should see the result of your `what_am_i` method.


### Question 2
If you take a look in the `app/controller/concerns/` directory, you'll see that we've defined a class for you called `Foobar`. This is where we'll be spending some time to practice Ruby!

If you take a look at `pages_controller.rb`, we have two commented lines of code:

```
# foo = Foobar.new "baz"
# @baz = foo.bar :cat, sat: :dat, dat: :sat
```

Write an `initialize` method and an instance method `bar` in `Foobar` so that when you uncomment the code in `pages_controller.rb`, the home page will render the string `"catbazdat"` under `"Your result"`. Do not hard code any strings; use the values passed into the `bar` method and the initializer.

Uncomment the code in `pages_controller.rb` and validate your changes.

### Question 3

Now we're going to look at more routing + creating classes!

If you look at the Question 3 section on the home page, you'll see that we have another form! However, if you submit it you'll get an error message telling you that no route matches the request.

Let's fix this bug.

Step 1: `<%= form_tag age_path, method: :put do %>` tells Rails to create a `PUT` request to `/age` on form submission. Create an appropriate route in `routes.rb` to handle the form submission; direct it to the `person` method in `pages_controller.rb`, rather than the `age` method. This means that a GET request to `/age` will be handled by a different action than a PUT request to `/age`!

Step 2: in `/controllers/concerns`, implement a `Person` class whose `initialize` method accepts a name and age and creates an instance variable `@nickname` that is the first four letters of `@name`.
The `Person` class should have the following methods:
- `introduce`: returns a string with the instance's name and age
- `birth_year`: calculates what year they were born given an age in years
- `nickname`: returns the nickname
- `fib_number`: returns the `@age`-th fib number (ex: if I am 21, return the 21th fib number).

Submit the Question 3 form (which will direct you to `localhost:3000/age`) and validate you did this correctly.

Note: don't worry about blank form edge cases (which we practiced handling before) and formatting.

### Question 4
Let's practice some HTML/CSS:

Create a view that can be seen if you go to `localhost:3000/me`. Just a friendly reminder, to do this you'll have to create a route, a controller action, and a view.

In this view, render your name, a picture of yourself (upload your file into `assets/images`), where you're from (give it a green background with white text), your year (freshman/sophomore/junior/senior/etc), a fun fact (make the text bold and red!), and what you're most excited about in this class (make the text underlined and change the color to anything you want!)

Go to `localhost:3000/me` and validate you did this correctly.

## How to submit
You're done! Whew. Time to submit! Run these commands:
```
git add .
git commit -am "whatever message you want"
git push origin master
```
Fill out the submission form for this homework, which can be found on Piazza.
>>>>>>> 1688dc2f6d857e76b2110695c1fe7506c686c1c8
