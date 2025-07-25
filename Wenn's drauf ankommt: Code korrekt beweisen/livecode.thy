theory Mergesort
  imports Main
begin

(* 2 Listen aneinanderhängen *)
fun app :: "'a list \<Rightarrow> 'a list \<Rightarrow> 'a list" where
  "app [] ys = ys" |
  "app (x # xs) ys = x # (app xs ys)"

value "app ([1,2,3]::nat list) [4,5,6]"

theorem [simp]: "app xs (app ys zs) = app (app xs ys) zs"
  apply (induction xs)
  apply (auto)
  done

(* Liste umdrehen *)
fun rev :: "'a list \<Rightarrow> 'a list" where
  "rev [] = []" |
  "rev (x # xs) = app (rev xs) [x]"

lemma [simp]: "app xs [] = xs"
  apply (induction xs)
  apply (auto)
  done

theorem "rev (app xs ys) = app (rev ys) (rev xs)"
  apply (induction xs)
  apply (auto)
  done

fun merge :: "('a::linorder) list \<Rightarrow> 'a list \<Rightarrow> 'a list" where
  "merge [] ys = ys" |
  "merge xs [] = xs " |
  "merge (x # xs) (y # ys) =
   (if x \<le> y
    then x # (merge xs (y # ys))
    else y # (merge (x # xs) ys))"


fun mergesort :: "('a::linorder) list \<Rightarrow> 'a list" where  
  "mergesort [] = []" |
  "mergesort [x] = [x]" |
  "mergesort xs = 
   (let middle = length xs div 2
    in merge (mergesort (take middle xs))
             (mergesort (drop middle xs)))" 

fun leq_all :: "('a::linorder) \<Rightarrow> 'a list \<Rightarrow> bool" where
  "leq_all x' [] = True" |
  "leq_all x' (x # xs) =
   (x' \<le> x \<and> leq_all x' xs)"


lemma [simp]: "x \<le> y \<Longrightarrow> leq_all y ys \<Longrightarrow> leq_all x ys"
  apply (induction ys)
  apply (auto)
  done

lemma [simp]: "\<not>x \<le> y \<Longrightarrow> leq_all x xs \<Longrightarrow> leq_all y xs"
  apply (induction xs)
  apply (auto)
  done

lemma [simp]: "leq_all x xs \<Longrightarrow> leq_all x ys \<Longrightarrow> leq_all x (merge xs ys)"
  apply (induction xs ys rule:merge.induct)
  apply (auto)
  done
  
fun is_sorted :: "('a::linorder) list \<Rightarrow> bool" where
  "is_sorted [] = True" |
  "is_sorted (x # xs) =
   (leq_all x xs \<and> is_sorted xs)"

(*
lemma "is_sorted xs \<Longrightarrow> is_sorted ys \<Longrightarrow> x \<le> y \<Longrightarrow> is_sorted (x # xs) \<Longrightarrow> is_sorted (y # ys) \<Longrightarrow> is_sorted (x # merge xs (y # ys))"
  apply (induction xs ys rule:merge.induct)
  apply (auto)
  done
*)

lemma [simp]: "is_sorted xs \<Longrightarrow> is_sorted ys \<Longrightarrow> is_sorted (merge xs ys)"
  apply (induction xs ys rule:merge.induct)
  apply (auto)
  done


theorem "is_sorted (mergesort xs)"
  apply (induction xs rule:mergesort.induct)
  apply (auto)
  done


value "mergesort ([3,7,0,5,2]::nat list)"
value "is_sorted (mergesort ([3,7,0,5,2]::nat list))"
value "is_sorted ([3,7,0,5,2]::nat list)"
end