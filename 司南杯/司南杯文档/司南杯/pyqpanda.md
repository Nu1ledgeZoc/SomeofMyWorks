
## Amplitude Amplification
[notesrc](https://pyqpanda-toturial.readthedocs.io/zh/latest/AmplitudeAmplification.html)

作用：调节给定纯态的振幅，从而放大该纯态的分布概率

将集合 $\Omega$ 中 的元素 $$| \psi \rangle $$ 表示为
$$
|\psi \rangle =\sin \theta |\varphi _1\rangle +\cos \theta |\varphi _0\rangle 
$$
其中的
$$
|\varphi _1\rangle ,|\varphi _0\rangle
$$
为一组正交基

我们构造一组量子门操作的组合，将其记为 $Q$ 使其作用 $k$ 次得到
$$
|\psi _k \rangle =\sin k\theta |\varphi _1\rangle +\cos k\theta |\varphi _0\rangle 
$$
相应的量子线路图如下
![[Pasted image 20220504164823.png]]

在 $$\{|\varphi_0\rangle,| \varphi_1\rangle \} $$
张成的空间中，算子 $Q$ 可以表示为
$$
Q=\left[ \begin{matrix}
	\cos 2\theta&		-\sin 2\theta\\
	\sin 2\theta&		\cos 2\theta\\
\end{matrix} \right] 
$$
