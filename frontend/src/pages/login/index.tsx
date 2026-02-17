import { GetServerSideProps } from "next";
import LoginForm from "../../components/login/loginForm";
import style from "./styles.module.css";
import { parseCookies } from "nookies";

export default function Login() {
	return (
		<div className={style.form}>
			<img alt="logo" src="./appointment_logo.svg" className={style.login_logo} />
			<h3 className={style.login_title}>Login</h3>
			<LoginForm />
		</div>
	);
}

export const getServerSideProps: GetServerSideProps = async (ctx) => {
	const { ["auth.token"]: token } = parseCookies(ctx);

	if (token) {
		return {
			redirect: {
				destination: "/schedule",
				permanent: false,
			},
		};
	}

	return {
		props: {},
	};
};
