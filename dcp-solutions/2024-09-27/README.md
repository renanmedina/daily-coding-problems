Good morning! Here's your coding interview problem for today.

This problem was asked by Google.

Given an array of integers and a number =
k, where 1 <=3D k <=3D length of the array,
compute the maximum values of =
each subarray of length k.

For example, given array =3D [10, 5, 2, 7, 8, =
7] and k =3D 3, we should get: [10, 7,
8, 8], since:

 * 10 =3D max(10, 5, 2)
 * 7 =3D max(5, 2, 7)
 * 8 =3D max(2, 7, 8)
 * 8 =3D max(7, 8, 7)

Do this in O(n) time and O(k) space. You can modify =
the input array in-place and
you do not need to store the results. You can =
simply print them out as you
compute them.