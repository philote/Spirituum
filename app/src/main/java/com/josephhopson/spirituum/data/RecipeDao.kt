package com.josephhopson.spirituum.data

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import kotlinx.coroutines.flow.Flow

/**
 * Recipe dao
 * TODO: Pagination: https://developer.android.com/training/data-storage/room/accessing-data#paging-integration
 * @constructor Create empty Recipe dao
 */
@Dao
interface RecipeDao {

    @Insert(onConflict = OnConflictStrategy.ABORT)
    suspend fun insert(recipe: Recipe)

    @Update
    suspend fun update(recipe: Recipe)

    @Delete
    suspend fun delete(recipe: Recipe)

    // FIXME needs all the things
    @Query("SELECT * from recipes WHERE recipeId = :id")
    fun getRecipe(id: Long): Flow<Recipe>

    // FIXME needs all the things
    @Query("SELECT * from recipes ORDER BY name ASC")
    fun getAllRecipes(): Flow<List<Recipe>>

    // With Ingredients

    // INFO with KOJOs
//    @Transaction
//    @Query("SELECT * from recipes ORDER BY name ASC")
//    fun getRecipesWithIngredients(): Flow<List<RecipeWithIngredients>>

    // TODO this wont work yet
//    @Transaction
//    @Query("SELECT * FROM ingredients")
//    suspend fun getIngredientWithRecipes(): List<IngredientWithRecipes>

//    @Insert(onConflict = OnConflictStrategy.ABORT)
//    suspend fun addNewRecipe(recipe: Recipe): Long
//
//    @Insert(onConflict = OnConflictStrategy.ABORT)
//    suspend fun addNewIngredients(newIngredients: List<Ingredient>)

//    @Transaction
//    @Insert(onConflict = OnConflictStrategy.ABORT)
//    suspend fun addNewRecipeWithIngredients(recipe: Recipe, ingredients: List<Ingredient>) {
//        val listId = addNewRecipe(recipe)

    // add ingredients with recipe ID
//    }
}