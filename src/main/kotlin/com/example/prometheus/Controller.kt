package com.example.prometheus

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import kotlin.random.Random

@RestController
class Controller {

    @GetMapping("/")
    fun hello() = "Hello"

    @GetMapping("/ex")
    fun error(): String = if (Random.nextBoolean()) "pass" else throw Exception("error!")
}