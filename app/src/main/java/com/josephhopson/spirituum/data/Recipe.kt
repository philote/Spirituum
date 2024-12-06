package com.josephhopson.spirituum.data

import androidx.room.Embedded
import androidx.room.Entity
import androidx.room.Junction
import androidx.room.PrimaryKey
import androidx.room.Relation

/**
 * Entity data class represents a single row in the database.
 * TODO implement Fts4 https://developer.android.com/training/data-storage/room/defining-data#fts
 */
@Entity(tableName = "recipes")
data class Recipe(
    @PrimaryKey(autoGenerate = true) val recipeId: Long = 0,
    val name: String,
    val about: String,
    val image: String,
    val instructions: String,
    val notes: String,
    val alcoholic: Boolean,
    val glassware: String,
    val garnish: String,
)

/* TODO
        val type: String, // TODO array of RecipeTypes
    val categories: String, // TODO array of Categories
 */

// Ingredients

@Entity(tableName = "ingredients")
data class Ingredient(
    @PrimaryKey(autoGenerate = true) val ingredientId: Long = 0,
    val name: String,
    val amount: String,
    val notes: String
)

@Entity(primaryKeys = ["recipeId", "ingredientId"])
data class RecipeIngredientCrossRef(
    val recipeId: Long,
    val ingredientId: Long
)

data class RecipeWithIngredients(
    @Embedded val recipe: Recipe,
    @Relation(
        parentColumn = "recipeId",
        entityColumn = "ingredientId",
        associateBy = Junction(RecipeIngredientCrossRef::class)
    )
    val ingredients: List<Ingredient>
)

/*
TODO this is not correct, need to find all ingredients with "whiskey" in the "name" column,
then get all recipe IDs from those ingredients, then use that list to get all recipes for the
"ingredient" of Whiskey
 */
//data class IngredientWithRecipes(
//    @Embedded val ingredient: Ingredient,
//    @Relation(
//        parentColumn = "ingredientId",
//        entityColumn = "recipeId",
//        associateBy = Junction(RecipeIngredientCrossRef::class)
//    )
//    val recipes: List<Recipe>
//)

// Tags

@Entity(tableName = "tags")
data class Tag(
    @PrimaryKey(autoGenerate = true) val tagId: Long = 0,
    val name: String
)

@Entity(primaryKeys = ["recipeId", "tagId"])
data class RecipeTagCrossRef(
    val recipeId: Long,
    val tagId: Long
)

data class RecipeWithTags(
    @Embedded val recipe: Recipe,
    @Relation(
        parentColumn = "recipeId",
        entityColumn = "tagId",
        associateBy = Junction(RecipeTagCrossRef::class)
    )
    val tags: List<Tag>
)

data class TagWithRecipes(
    @Embedded val tag: Tag,
    @Relation(
        parentColumn = "tagId",
        entityColumn = "recipeId",
        associateBy = Junction(RecipeTagCrossRef::class)
    )
    val recipes: List<Recipe>
)